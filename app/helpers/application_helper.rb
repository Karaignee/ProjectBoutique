module ApplicationHelper

    def flash_class(type)
        case type
          when :alert
               "alert-error"
          when :notice
                "alert-info"
          else
            ""
        end
    end
    def hidden_div_if(condition, attributes = {}, &block)
      if condition
          attributes["style"] = "display:none;"
      end
      content_tag("div", attributes, &block )
    end
end
