class Api::V1::WeatherController < ApplicationController
  include CustomTracerConcern

  def show
    ControllerTracer.in_span('show') do |span|
      realtime = Benchmark.realtime do
        result = OpenWeather.new(query_params).fetch
        if result.has_key?(:error)
          render json: result, status: :unprocessable_entity
        else
          render json: result, status: :ok
        end
      end

      save_trace(span, {
                   response_time: realtime,
                   controller: request.path_parameters[:controller],
                   action: request.path_parameters[:action]
                 })
    end
  end

  private

  def query_params
    params.permit(:city)
  end
end
