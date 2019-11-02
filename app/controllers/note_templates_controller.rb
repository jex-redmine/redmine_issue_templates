# frozen_string_literal: true

class NoteTemplatesController < ApplicationController
  include Concerns::ProjectTemplatesCommon
  layout 'base'
  helper :issue_templates
  menu_item :issues

  def index
    project_id = @project.id
    note_templates = NoteTemplate.search_by_project(project_id).sorted

    # pick up used tracker ids
    tracker_ids = @project.trackers.pluck(:id)

    @template_map = {}
    tracker_ids.each do |tracker_id|
      templates = note_templates.search_by_tracker(tracker_id)
      @template_map[Tracker.find(tracker_id)] = templates if templates.any?
    end

    respond_to do |format|
      format.html do
        render layout: !request.xhr?, locals: { tracker_ids: tracker_ids }
      end
      format.api do
        render formats: :json, locals: { note_templates: note_templates }
      end
    end
  end

  def new
    @note_template ||= NoteTemplate.new(author: @user, project: @project)
    render render_form_params
  end

  def create
    @note_template = NoteTemplate.new(template_params)
    @note_template.author = User.current
    @note_template.project = @project
    save_and_flash(:notice_successful_create, :new) && return
  end

  def update
    # Workaround in case author id is null
    @note_template.author = User.current if @note_template.author.blank?
    @note_template.safe_attributes = template_params
    @note_template.role_ids = template_params[:role_ids]

    save_and_flash(:notice_successful_update, :show)
  end

  # load template description
  def load
    note_template_id = template_params[:note_template_id]
    note_template = NoteTemplate.find(note_template_id)

    # prevent to load if the template visibility does not match.
    render_404 unless note_template.loadable?(user_id: User.current.id)

    render plain: note_template.template_json
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def list_templates
    tracker_id = params[:tracker_id]
    project_id = params[:project_id]

    note_templates = NoteTemplate.visible_note_templates_condition(
      user_id: User.current.id, project_id: project_id, tracker_id: tracker_id
    )
    respond_to do |format|
      format.html do
        render action: '_list_note_templates',
               layout: false,
               locals: { note_templates: note_templates }
      end
    end
  end

  def destroy
    unless @note_template.destroy
      flash[:error] = l(:enabled_template_cannot_destroy)
      redirect_to action: :show, project_id: @project, id: @note_template
      return
    end

    flash[:notice] = l(:notice_successful_delete)
    redirect_to action: 'index', project_id: @project
  end

  private

  def find_object
    @note_template = NoteTemplate.find(params[:id])
    @project = @note_template.project
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def template_params
    params.require(:note_template)
          .permit(:note_template_id, :tracker_id, :name, :memo, :description,
                  :enabled, :author_id, :position, :visibility, role_ids: [])
  end

  def template
    @note_template
  end

  def render_form_params
    { layout: !request.xhr?,
      locals: { note_template: template, project: @project } }
  end
end
