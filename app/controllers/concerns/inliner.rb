module Inliner
  extend ActiveSupport::Concern

  included do
    before_action :set_parent, only: [:index, :new, :create, :form_for_update]
    before_action :set_object_from_params, only: [:form_for, :form_for_update]
  end

  module ClassMethods
    attr_accessor :child
    attr_accessor :parent

    def inline_object(child, parent)
      self.child = child.to_s
      self.parent = parent.to_s
    end

    def child_var
      "@#{self.child}"
    end
    def parent_var
      "@#{self.parent}"
    end
  end

  def form_for
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: instance_variable_get(child_var), status: 200 }
    end
  end

  def form_for_update
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: instance_variable_get(child_var), status: 200 }
    end
  end

  private
  def set_parent
    parent_id = params["#{self.class.parent}_id".to_sym]
    instance_variable_set("@#{self.class.parent}", self.class.parent.camelize.constantize.find(parent_id)) if parent_id
  end

  def set_object_from_params
    send("set_#{self.class.child}")

    var = "@#{self.class.child}"
    instance_variable_set var, self.class.child.camelize.constantize.new unless instance_variable_defined?(var)
    instance_variable_get(var).assign_attributes(send("#{self.class.child}_params"))
  end
end