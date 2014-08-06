module InlineHelper
  def inline_fields_for(form, association, name_link_to_add = nil)
    res = form.fields_for association.to_sym do |row|
      render("#{association.to_s}/#{association.to_s.singularize}_inline_fields", f: row)
    end
    if name_link_to_add
      res += link_to_add_inline_fields(name_link_to_add, form, association)
    end
    res
  end

  def link_to_add_inline_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association.to_s}/#{association.to_s.singularize}_inline_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def fields_for_child(klass, association, child)
    new_parent = klass.new
    id = child.object_id

    fields = ''
    simple_form_for new_parent do |f|
      fields = f.fields_for(association, child, child_index: id) do |builder|
        render("#{association.to_s}/#{association.to_s.singularize}_inline_fields", f: builder)
      end
      fields += f.input :id, as: :hidden unless child.new_record?
    end

    fields
  end
end