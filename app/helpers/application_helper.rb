module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "OLPH School Volunteer Center App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def _error_msg(*params)

    options = params.extract_options!.symbolize_keys
    if object = options.delete(:object)
      objects = [object].flatten
    else
      objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
    end
    count   = objects.inject(0) {|sum, this| sum + this.errors.count }
    unless count.zero?
      html = {}
      [:id, :class].each do |key|
        if options.include?(key)
          value = options[key]
          html[key] = value unless value.blank?
        else
          html[key] = 'errorExplanation'
        end
      end
      options[:object_name] ||= params.first
      options[:header_message] = "#{pluralize(count, 'error')} prohibited this #{options[:object_name].to_s.gsub('_', ' ')} from being saved" unless options.include?(:header_message) && !options[:header_messag].nil?
      options[:message] ||= 'There were problems with the following fields:' unless options.include?(:message) && !options[:message].nil?
      error_messages = objects.sum {|this| this.errors.full_messages.map {|msg| content_tag(:li, msg) } }.join

      contents = ''
      contents << content_tag(options[:header_tag] || :h2, options[:header_message]) unless options[:header_message].blank?
      contents << content_tag(:p, options[:message]) unless options[:message].blank?
      contents << content_tag(:ul, error_messages)

      content_tag(:div, contents, html)
    else
                                        ''
    end

  end

  def my_error_msg_for(params)
    _error_msg :object_name => params[:object].class.name.gsub(/([a-z])([A-Z])/,'\1 \2').gsub(/_/, " "),
    :object => params[:object], :header_message => params[:header_message], :message => params[:message]
  end
end


def field_id_for_js(builder, attribute)
    "#{builder.object_name}[#{attribute.to_s.sub(/\?$/,"")}]".gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
end

def field_name_for_js(builder, attribute)
    "#{builder.object_name}[#{attribute.to_s.sub(/\?$/,"")}]"
end

def hours_summary_for_seconds(t)

  mm, ss = t.divmod(60)            #=> [4515, 21]
  hh, mm = mm.divmod(60)           #=> [75, 15]
  
  
  "%d hours, %d minutes" % [hh, mm]
end


