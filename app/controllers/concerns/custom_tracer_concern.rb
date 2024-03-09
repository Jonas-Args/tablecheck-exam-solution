module CustomTracerConcern
  extend ActiveSupport::Concern

  private

  def save_trace(span, obj)
    obj.each do |attr_name, attr_value|
      span.set_attribute(attr_name.to_s, attr_value)
    end
  end
end
