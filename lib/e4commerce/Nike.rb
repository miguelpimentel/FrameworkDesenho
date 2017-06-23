class Nike < Produto
   validates :numero, presence: true
   validates :cor, presence: true
end