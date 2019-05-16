class EmployerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :vat_label, :vat
end
