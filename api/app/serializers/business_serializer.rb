class BusinessSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :vat_label, :vat, :iban
end
