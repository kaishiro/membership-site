class RegistrationPage < SimpleDelegator
  def visit
    super("/buy")
  end

  def enter_valid_personal_details
    enter_personal_details(
      full_name: "Peter Gregory",
      email: "peter@hooli.com",
      password: "c1cadas"
    )
  end

  def enter_valid_payment_details
    enter_payment_details(card: "4242424242424242")
  end

  def enter_invalid_payment_details
    enter_payment_details(card: "4000000000000341")
  end

  def enter_personal_details(attrs={})
    fill_in "membership_registration_form[full_name]", with: attrs[:full_name]
    fill_in "membership_registration_form[email]",     with: attrs[:email]
    fill_in "membership_registration_form[password]",  with: attrs[:password]
  end

  def submit_registration
    click_button "Register"
  end

  private

  def enter_payment_details(details={})
    next_month = Time.now.next_month
    find_stripe_field("number").set(details.fetch(:card))
    find_stripe_field("exp-month").
      set(details.fetch(:exp_month, next_month.strftime("%m")))
    find_stripe_field("exp-year").
      set(details.fetch(:exp_year, next_month.year))
    find_stripe_field("cvc").
      set(details.fetch(:cvc, 123))
  end

  def find_stripe_field(name)
    find(:xpath, "//input[@data-stripe='#{name}']")
  end
end
