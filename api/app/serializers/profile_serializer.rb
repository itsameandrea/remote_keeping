class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :auto_clock_in, :auto_invoicing
end
