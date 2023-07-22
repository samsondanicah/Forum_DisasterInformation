class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default,
                      username: exception.policy.record&.user&.email
    redirect_to(request.referrer || root_path)
  end

  def pundit_user
    current_user
  end
end
