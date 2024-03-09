require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'tablecheck'
end

ControllerTracer = OpenTelemetry.tracer_provider.tracer('CONTROLLER')
