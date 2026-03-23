# Vobiz::PhoneNumbersApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_auth_id_inventory_numbers_get**](PhoneNumbersApi.md#api_v1_account_auth_id_inventory_numbers_get) | **GET** /api/v1/account/{auth_id}/inventory/numbers | List Inventory Numbers |
| [**api_v1_account_auth_id_numbers_e164_number_delete**](PhoneNumbersApi.md#api_v1_account_auth_id_numbers_e164_number_delete) | **DELETE** /api/v1/account/{auth_id}/numbers/:e164_number | Unrent a Phone Number |
| [**api_v1_account_auth_id_numbers_get**](PhoneNumbersApi.md#api_v1_account_auth_id_numbers_get) | **GET** /api/v1/account/{auth_id}/numbers | List Account Phone Numbers |
| [**api_v1_account_auth_id_numbers_purchase_from_inventory_post**](PhoneNumbersApi.md#api_v1_account_auth_id_numbers_purchase_from_inventory_post) | **POST** /api/v1/account/{auth_id}/numbers/purchase-from-inventory | Purchase from Inventory |


## api_v1_account_auth_id_inventory_numbers_get

> api_v1_account_auth_id_inventory_numbers_get(auth_id, opts)

List Inventory Numbers

Browse available phone numbers in inventory for purchase.

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

api_instance = Vobiz::PhoneNumbersApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  country: 'US', # String | Filter by country code
  page: 1, # Integer | Page number
  per_page: 20 # Integer | Results per page
}

begin
  # List Inventory Numbers
  api_instance.api_v1_account_auth_id_inventory_numbers_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_inventory_numbers_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_inventory_numbers_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_inventory_numbers_get_with_http_info(auth_id, opts)

```ruby
begin
  # List Inventory Numbers
  data, status_code, headers = api_instance.api_v1_account_auth_id_inventory_numbers_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_inventory_numbers_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **country** | **String** | Filter by country code | [optional] |
| **page** | **Integer** | Page number | [optional] |
| **per_page** | **Integer** | Results per page | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_auth_id_numbers_e164_number_delete

> api_v1_account_auth_id_numbers_e164_number_delete(auth_id, opts)

Unrent a Phone Number

Release (unrent) a phone number from your account.

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

api_instance = Vobiz::PhoneNumbersApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Unrent a Phone Number
  api_instance.api_v1_account_auth_id_numbers_e164_number_delete(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_e164_number_delete: #{e}"
end
```

#### Using the api_v1_account_auth_id_numbers_e164_number_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_numbers_e164_number_delete_with_http_info(auth_id, opts)

```ruby
begin
  # Unrent a Phone Number
  data, status_code, headers = api_instance.api_v1_account_auth_id_numbers_e164_number_delete_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_e164_number_delete_with_http_info: #{e}"
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


## api_v1_account_auth_id_numbers_get

> api_v1_account_auth_id_numbers_get(auth_id, opts)

List Account Phone Numbers

Retrieve all phone numbers associated with your account.

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

api_instance = Vobiz::PhoneNumbersApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # List Account Phone Numbers
  api_instance.api_v1_account_auth_id_numbers_get(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_get: #{e}"
end
```

#### Using the api_v1_account_auth_id_numbers_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_numbers_get_with_http_info(auth_id, opts)

```ruby
begin
  # List Account Phone Numbers
  data, status_code, headers = api_instance.api_v1_account_auth_id_numbers_get_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_get_with_http_info: #{e}"
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


## api_v1_account_auth_id_numbers_purchase_from_inventory_post

> api_v1_account_auth_id_numbers_purchase_from_inventory_post(auth_id, opts)

Purchase from Inventory

Purchase a phone number from available inventory.

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

api_instance = Vobiz::PhoneNumbersApi.new
auth_id = 'auth_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Purchase from Inventory
  api_instance.api_v1_account_auth_id_numbers_purchase_from_inventory_post(auth_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_purchase_from_inventory_post: #{e}"
end
```

#### Using the api_v1_account_auth_id_numbers_purchase_from_inventory_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_auth_id_numbers_purchase_from_inventory_post_with_http_info(auth_id, opts)

```ruby
begin
  # Purchase from Inventory
  data, status_code, headers = api_instance.api_v1_account_auth_id_numbers_purchase_from_inventory_post_with_http_info(auth_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling PhoneNumbersApi->api_v1_account_auth_id_numbers_purchase_from_inventory_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **body** | **Object** |  | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

