Factory.define :admin, :class => Admin do |a|
  a.login "test@test.com"
  a.password "test"
  a.password_confirmation "test"
end