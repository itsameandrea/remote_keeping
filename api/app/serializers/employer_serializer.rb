class EmployerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :vat_label, :vat
end
