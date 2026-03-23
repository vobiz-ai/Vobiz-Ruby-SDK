# Vobiz::AccountApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_account_id_balance_inr_get**](AccountApi.md#api_v1_account_account_id_balance_inr_get) | **GET** /api/v1/account/{account_id}/balance/INR | Get Balance |
| [**api_v1_account_account_id_transactions_get**](AccountApi.md#api_v1_account_account_id_transactions_get) | **GET** /api/v1/account/{account_id}/transactions | Get Transactions |
| [**api_v1_account_auth_id_concurrency_get**](AccountApi.md#api_v1_account_auth_id_concurrency_get) | **GET** /api/v1/account/{auth_id}/concurrency | Get Concurrency |
| [**api_v1_auth_me_get**](AccountApi.md#api_v1_auth_me_get) | **GET** /api/v1/auth/me | Retrieve Account Details |


## api_v1_account_account_id_balance_inr_get

> api_v1_account_account_id_balance_inr_get(account_id, opts)

Get Balance

Retrieve the balance for a specific account and currency. Replace 'INR' with your currency code.

### Examples

```ruby
require 'time'
require 'vobiz'
# setup authorization
Vobiz.configure do |config|
  # Configure API key authorization: ApiKeyAuthID
  config.api_key['X-Auth-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-ID'] = 'Bearer'

  # Configure API key authorization: ApiKeyAuthToken
  config.api_key['X-Auth-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-Token'] = 'Bearer'
end

api_instance = Vobiz::AccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Get Balance
  api_instance.api_v1_account_account_id_balance_inr_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_account_id_balance_inr_get: #{e}"
end
```

#### Using the api_v1_account_account_id_balance_inr_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_balance_inr_get_with_http_info(account_id, opts)

```ruby
begin
  # Get Balance
  data, status_code, headers = api_instance.api_v1_account_account_id_balance_inr_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_account_id_balance_inr_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_account_id_transactions_get

> api_v1_account_account_id_transactions_get(account_id, opts)

Get Transactions

Retrieve a list of transactions for a specific account.

### Examples

```ruby
require 'time'
require 'vobiz'
# setup authorization
Vobiz.configure do |config|
  # Configure API key authorization: ApiKeyAuthID
  config.api_key['X-Auth-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-ID'] = 'Bearer'

  # Configure API key authorization: ApiKeyAuthToken
  config.api_key['X-Auth-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-Token'] = 'Bearer'
end

api_instance = Vobiz::AccountApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 50, # Integer | Records per page (default: 50)
  offset: 0 # Integer | Pagination offset (default: 0)
}

begin
  # Get Transactions
  api_instance.api_v1_account_account_id_transactions_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_account_id_transactions_get: #{e}"
end
```

#### Using the api_v1_account_account_id_transactions_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_transactions_get_with_http_info(account_id, opts)

```ruby
begin
  # Get Transactions
  data, status_code, headers = api_instance.api_v1_account_account_id_transactions_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_account_id_transactions_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Records per page (default: 50) | [optional] |
| **offset** | **Integer** | Pagination offset (default: 0) | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_concurrency_get

> api_v1_account_auth_id_concurrency_get(auth_id, opts)

Get Concurrency

Retrieve current concurrent call count and capacity.

### Examples

```ruby
require 'time'
require 'vobiz'
# setup authorization
Vobiz.configure do |config|
  # Configure API key authorization: ApiKeyAuthID
  config.api_key['X-Auth-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-ID'] = 'Bearer'

  # Configure API key authorization: ApiKeyAuthToken
  config.api_key['X-Auth-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-Token'] = 'Bearer'
end

api_instance = Vobiz::AccountApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Get Concurrency
  api_instance.api_v1_account_auth_id_concurrency_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_auth_id_concurrency_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_concurrency_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_concurrency_get_with_http_info(auth_id, opts)

```ruby
begin
  # Get Concurrency
  data, status_code, headers = api_instance.api_v1_account_auth_id_concurrency_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_account_auth_id_concurrency_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_auth_me_get

> api_v1_auth_me_get(opts)

Retrieve Account Details

Retrieve complete account details including pricing tier, credentials, and account settings.

### Examples

```ruby
require 'time'
require 'vobiz'
# setup authorization
Vobiz.configure do |config|
  # Configure API key authorization: ApiKeyAuthID
  config.api_key['X-Auth-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-ID'] = 'Bearer'

  # Configure API key authorization: ApiKeyAuthToken
  config.api_key['X-Auth-Token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-Auth-Token'] = 'Bearer'
end

api_instance = Vobiz::AccountApi.new
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve Account Details
  api_instance.api_v1_auth_me_get(opts)
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_auth_me_get: #{e}"
end
```

#### Using the api_v1_auth_me_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_auth_me_get_with_http_info(opts)

```ruby
begin
  # Retrieve Account Details
  data, status_code, headers = api_instance.api_v1_auth_me_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling AccountApi->api_v1_auth_me_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

