class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :self_introduction, :icon]
    )
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:name, :self_introduction, :icon]
    )
  end

end
