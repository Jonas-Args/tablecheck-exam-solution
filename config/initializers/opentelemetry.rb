require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'tablecheck'
  c.use 'OpenTelemetry::Instrumentation::Rails'
  # c.use_all() # disabled because we want custom tracing
end

ControllerTracer = OpenTelemetry.tracer_provider.tracer('CONTROLLER')
