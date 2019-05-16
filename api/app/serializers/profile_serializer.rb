class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :auto_clock_in, :auto_invoicing
end
