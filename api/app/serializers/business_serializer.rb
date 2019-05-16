class BusinessSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :vat_label, :vat, :iban
end
