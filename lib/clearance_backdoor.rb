class ClearanceBackdoor
  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    sign_in_through_the_back_door
    @app.call(@env)
  end

  private

  def sign_in_through_the_back_door
    if user_id = params['as']
      user = User.find(user_id)
      @env[:clearance].sign_in(user)
    end
  end

  def params
    Rack::Utils.parse_query(@env['QUERY_STRING'])
  end
end
