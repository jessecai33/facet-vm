Rails.application.routes.draw do
  resources :contracts, only: [:index, :show] do
    collection do
      get "/:address/call-receipts/", to: "contracts#contract_call_receipts", constraints: { address: /(0x)?[a-zA-Z0-9]{40}/ }
      get "/:address/static-call/:function", to: "contracts#static_call", constraints: { address: /(0x)?[a-zA-Z0-9]{40}/ }
      get "/call-receipts/:transaction_hash", to: "contracts#show_call_receipt", constraints: { transaction_hash: /(0x)?[a-zA-Z0-9]{64}/ }
      get "/simulate", to: "contracts#simulate_transaction"
      
      get "/all-abis", to: "contracts#all_abis"
      get "/deployable-contracts", to: "contracts#deployable_contracts"
      
      
      get "/pairs_with_tokens/:factory", to: "contracts#pairs_with_tokens"
    end
  end
  
  get "/status", to: "status#vm_status"
end
