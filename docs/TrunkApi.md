# Vobiz::TrunkApi

All URIs are relative to *https://api.vobiz.ai*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**api_v1_account_account_id_credentials_credential_id_delete**](TrunkApi.md#api_v1_account_account_id_credentials_credential_id_delete) | **DELETE** /api/v1/account/{account_id}/credentials/:credential_id | Delete a Credential |
| [**api_v1_account_account_id_credentials_credential_id_put**](TrunkApi.md#api_v1_account_account_id_credentials_credential_id_put) | **PUT** /api/v1/account/{account_id}/credentials/:credential_id | Update a Credential |
| [**api_v1_account_account_id_credentials_post**](TrunkApi.md#api_v1_account_account_id_credentials_post) | **POST** /api/v1/account/{account_id}/credentials | Create Credential |
| [**api_v1_account_account_id_ip_acl_ip_acl_id_delete**](TrunkApi.md#api_v1_account_account_id_ip_acl_ip_acl_id_delete) | **DELETE** /api/v1/account/{account_id}/ip-acl/:ip_acl_id | Delete an IP ACL |
| [**api_v1_account_account_id_ip_acl_ip_acl_id_put**](TrunkApi.md#api_v1_account_account_id_ip_acl_ip_acl_id_put) | **PUT** /api/v1/account/{account_id}/ip-acl/:ip_acl_id | Update an IP ACL |
| [**api_v1_account_account_id_ip_acl_post**](TrunkApi.md#api_v1_account_account_id_ip_acl_post) | **POST** /api/v1/account/{account_id}/ip-acl | Create IP ACL |
| [**api_v1_account_account_id_numbers_assign_delete**](TrunkApi.md#api_v1_account_account_id_numbers_assign_delete) | **DELETE** /api/v1/account/{account_id}/numbers/{}/assign | Unassign Number from Trunk |
| [**api_v1_account_account_id_numbers_assign_post**](TrunkApi.md#api_v1_account_account_id_numbers_assign_post) | **POST** /api/v1/account/{account_id}/numbers/{}/assign | Assign Number to Trunk |
| [**api_v1_account_account_id_origination_uris_post**](TrunkApi.md#api_v1_account_account_id_origination_uris_post) | **POST** /api/v1/account/{account_id}/origination-uris | Create Origination URI |
| [**api_v1_account_account_id_origination_uris_uri_id_delete**](TrunkApi.md#api_v1_account_account_id_origination_uris_uri_id_delete) | **DELETE** /api/v1/account/{account_id}/origination-uris/:uri_id | Delete an Origination URI |
| [**api_v1_account_account_id_origination_uris_uri_id_put**](TrunkApi.md#api_v1_account_account_id_origination_uris_uri_id_put) | **PUT** /api/v1/account/{account_id}/origination-uris/:uri_id | Update an Origination URI |
| [**api_v1_account_account_id_trunks_credentials_get**](TrunkApi.md#api_v1_account_account_id_trunks_credentials_get) | **GET** /api/v1/account/{account_id}/trunks/credentials | List All Credentials |
| [**api_v1_account_account_id_trunks_get**](TrunkApi.md#api_v1_account_account_id_trunks_get) | **GET** /api/v1/account/{account_id}/trunks | List All Trunks |
| [**api_v1_account_account_id_trunks_ip_acl_get**](TrunkApi.md#api_v1_account_account_id_trunks_ip_acl_get) | **GET** /api/v1/account/{account_id}/trunks/ip-acl | List All IP ACLs |
| [**api_v1_account_account_id_trunks_origination_uris_get**](TrunkApi.md#api_v1_account_account_id_trunks_origination_uris_get) | **GET** /api/v1/account/{account_id}/trunks/origination-uris | List All Origination URIs |
| [**api_v1_account_account_id_trunks_post**](TrunkApi.md#api_v1_account_account_id_trunks_post) | **POST** /api/v1/account/{account_id}/trunks | Create Trunk |
| [**api_v1_account_account_id_trunks_trunk_id_delete**](TrunkApi.md#api_v1_account_account_id_trunks_trunk_id_delete) | **DELETE** /api/v1/account/{account_id}/trunks/:trunk_id | Delete a Trunk |
| [**api_v1_account_account_id_trunks_trunk_id_get**](TrunkApi.md#api_v1_account_account_id_trunks_trunk_id_get) | **GET** /api/v1/account/{account_id}/trunks/:trunk_id | Retrieve a Trunk |
| [**api_v1_account_account_id_trunks_trunk_id_put**](TrunkApi.md#api_v1_account_account_id_trunks_trunk_id_put) | **PUT** /api/v1/account/{account_id}/trunks/:trunk_id | Update a Trunk |


## api_v1_account_account_id_credentials_credential_id_delete

> api_v1_account_account_id_credentials_credential_id_delete(account_id, opts)

Delete a Credential

Delete a SIP credential. Returns 204 No Content.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete a Credential
  api_instance.api_v1_account_account_id_credentials_credential_id_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_credential_id_delete: #{e}"
end
```

#### Using the api_v1_account_account_id_credentials_credential_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_credentials_credential_id_delete_with_http_info(account_id, opts)

```ruby
begin
  # Delete a Credential
  data, status_code, headers = api_instance.api_v1_account_account_id_credentials_credential_id_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_credential_id_delete_with_http_info: #{e}"
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


## api_v1_account_account_id_credentials_credential_id_put

> api_v1_account_account_id_credentials_credential_id_put(account_id, opts)

Update a Credential

Update SIP credential settings.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update a Credential
  api_instance.api_v1_account_account_id_credentials_credential_id_put(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_credential_id_put: #{e}"
end
```

#### Using the api_v1_account_account_id_credentials_credential_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_credentials_credential_id_put_with_http_info(account_id, opts)

```ruby
begin
  # Update a Credential
  data, status_code, headers = api_instance.api_v1_account_account_id_credentials_credential_id_put_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_credential_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_credentials_post

> api_v1_account_account_id_credentials_post(account_id, opts)

Create Credential

Create SIP authentication credentials for a trunk.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Credential
  api_instance.api_v1_account_account_id_credentials_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_post: #{e}"
end
```

#### Using the api_v1_account_account_id_credentials_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_credentials_post_with_http_info(account_id, opts)

```ruby
begin
  # Create Credential
  data, status_code, headers = api_instance.api_v1_account_account_id_credentials_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_credentials_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_ip_acl_ip_acl_id_delete

> api_v1_account_account_id_ip_acl_ip_acl_id_delete(account_id, opts)

Delete an IP ACL

Delete an IP ACL entry. Returns 204 No Content.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete an IP ACL
  api_instance.api_v1_account_account_id_ip_acl_ip_acl_id_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_ip_acl_id_delete: #{e}"
end
```

#### Using the api_v1_account_account_id_ip_acl_ip_acl_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_ip_acl_ip_acl_id_delete_with_http_info(account_id, opts)

```ruby
begin
  # Delete an IP ACL
  data, status_code, headers = api_instance.api_v1_account_account_id_ip_acl_ip_acl_id_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_ip_acl_id_delete_with_http_info: #{e}"
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


## api_v1_account_account_id_ip_acl_ip_acl_id_put

> api_v1_account_account_id_ip_acl_ip_acl_id_put(account_id, opts)

Update an IP ACL

Update an IP ACL entry.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update an IP ACL
  api_instance.api_v1_account_account_id_ip_acl_ip_acl_id_put(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_ip_acl_id_put: #{e}"
end
```

#### Using the api_v1_account_account_id_ip_acl_ip_acl_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_ip_acl_ip_acl_id_put_with_http_info(account_id, opts)

```ruby
begin
  # Update an IP ACL
  data, status_code, headers = api_instance.api_v1_account_account_id_ip_acl_ip_acl_id_put_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_ip_acl_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_ip_acl_post

> api_v1_account_account_id_ip_acl_post(account_id, opts)

Create IP ACL

Create an IP Access Control List entry for trunk authentication.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create IP ACL
  api_instance.api_v1_account_account_id_ip_acl_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_post: #{e}"
end
```

#### Using the api_v1_account_account_id_ip_acl_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_ip_acl_post_with_http_info(account_id, opts)

```ruby
begin
  # Create IP ACL
  data, status_code, headers = api_instance.api_v1_account_account_id_ip_acl_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_ip_acl_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_numbers_assign_delete

> api_v1_account_account_id_numbers_assign_delete(account_id, opts)

Unassign Number from Trunk

Remove a phone number from its trunk assignment. Returns 204 No Content.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Unassign Number from Trunk
  api_instance.api_v1_account_account_id_numbers_assign_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_numbers_assign_delete: #{e}"
end
```

#### Using the api_v1_account_account_id_numbers_assign_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_numbers_assign_delete_with_http_info(account_id, opts)

```ruby
begin
  # Unassign Number from Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_numbers_assign_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_numbers_assign_delete_with_http_info: #{e}"
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


## api_v1_account_account_id_numbers_assign_post

> api_v1_account_account_id_numbers_assign_post(account_id, opts)

Assign Number to Trunk

Assign a phone number to a trunk group.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Assign Number to Trunk
  api_instance.api_v1_account_account_id_numbers_assign_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_numbers_assign_post: #{e}"
end
```

#### Using the api_v1_account_account_id_numbers_assign_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_numbers_assign_post_with_http_info(account_id, opts)

```ruby
begin
  # Assign Number to Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_numbers_assign_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_numbers_assign_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_origination_uris_post

> api_v1_account_account_id_origination_uris_post(account_id, opts)

Create Origination URI

Create an origination URI for inbound SIP routing.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Origination URI
  api_instance.api_v1_account_account_id_origination_uris_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_post: #{e}"
end
```

#### Using the api_v1_account_account_id_origination_uris_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_origination_uris_post_with_http_info(account_id, opts)

```ruby
begin
  # Create Origination URI
  data, status_code, headers = api_instance.api_v1_account_account_id_origination_uris_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_origination_uris_uri_id_delete

> api_v1_account_account_id_origination_uris_uri_id_delete(account_id, opts)

Delete an Origination URI

Delete an origination URI. Returns 204 No Content.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete an Origination URI
  api_instance.api_v1_account_account_id_origination_uris_uri_id_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_uri_id_delete: #{e}"
end
```

#### Using the api_v1_account_account_id_origination_uris_uri_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_origination_uris_uri_id_delete_with_http_info(account_id, opts)

```ruby
begin
  # Delete an Origination URI
  data, status_code, headers = api_instance.api_v1_account_account_id_origination_uris_uri_id_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_uri_id_delete_with_http_info: #{e}"
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


## api_v1_account_account_id_origination_uris_uri_id_put

> api_v1_account_account_id_origination_uris_uri_id_put(account_id, opts)

Update an Origination URI

Update an origination URI.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update an Origination URI
  api_instance.api_v1_account_account_id_origination_uris_uri_id_put(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_uri_id_put: #{e}"
end
```

#### Using the api_v1_account_account_id_origination_uris_uri_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_origination_uris_uri_id_put_with_http_info(account_id, opts)

```ruby
begin
  # Update an Origination URI
  data, status_code, headers = api_instance.api_v1_account_account_id_origination_uris_uri_id_put_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_origination_uris_uri_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_trunks_credentials_get

> api_v1_account_account_id_trunks_credentials_get(account_id, opts)

List All Credentials

Retrieve all SIP credentials.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All Credentials
  api_instance.api_v1_account_account_id_trunks_credentials_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_credentials_get: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_credentials_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_credentials_get_with_http_info(account_id, opts)

```ruby
begin
  # List All Credentials
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_credentials_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_credentials_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Results per page | [optional] |
| **offset** | **Integer** | Pagination offset | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_account_id_trunks_get

> api_v1_account_account_id_trunks_get(account_id, opts)

List All Trunks

Retrieve all trunks.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All Trunks
  api_instance.api_v1_account_account_id_trunks_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_get: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_get_with_http_info(account_id, opts)

```ruby
begin
  # List All Trunks
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Results per page | [optional] |
| **offset** | **Integer** | Pagination offset | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_account_id_trunks_ip_acl_get

> api_v1_account_account_id_trunks_ip_acl_get(account_id, opts)

List All IP ACLs

Retrieve all IP ACL entries.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All IP ACLs
  api_instance.api_v1_account_account_id_trunks_ip_acl_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_ip_acl_get: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_ip_acl_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_ip_acl_get_with_http_info(account_id, opts)

```ruby
begin
  # List All IP ACLs
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_ip_acl_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_ip_acl_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Results per page | [optional] |
| **offset** | **Integer** | Pagination offset | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_account_id_trunks_origination_uris_get

> api_v1_account_account_id_trunks_origination_uris_get(account_id, opts)

List All Origination URIs

Retrieve all origination URIs.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  limit: 20, # Integer | Results per page
  offset: 0 # Integer | Pagination offset
}

begin
  # List All Origination URIs
  api_instance.api_v1_account_account_id_trunks_origination_uris_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_origination_uris_get: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_origination_uris_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_origination_uris_get_with_http_info(account_id, opts)

```ruby
begin
  # List All Origination URIs
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_origination_uris_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_origination_uris_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
| **x_auth_id** | **String** |  | [optional] |
| **x_auth_token** | **String** |  | [optional] |
| **content_type** | **String** |  | [optional] |
| **limit** | **Integer** | Results per page | [optional] |
| **offset** | **Integer** | Pagination offset | [optional] |

### Return type

nil (empty response body)

### Authorization

[ApiKeyAuthID](../README.md#ApiKeyAuthID), [ApiKeyAuthToken](../README.md#ApiKeyAuthToken)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## api_v1_account_account_id_trunks_post

> api_v1_account_account_id_trunks_post(account_id, opts)

Create Trunk

Create a new SIP trunk.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Create Trunk
  api_instance.api_v1_account_account_id_trunks_post(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_post: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_post_with_http_info(account_id, opts)

```ruby
begin
  # Create Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_post_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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


## api_v1_account_account_id_trunks_trunk_id_delete

> api_v1_account_account_id_trunks_trunk_id_delete(account_id, opts)

Delete a Trunk

Delete a trunk. Returns 204 No Content.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Delete a Trunk
  api_instance.api_v1_account_account_id_trunks_trunk_id_delete(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_delete: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_trunk_id_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_trunk_id_delete_with_http_info(account_id, opts)

```ruby
begin
  # Delete a Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_trunk_id_delete_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_delete_with_http_info: #{e}"
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


## api_v1_account_account_id_trunks_trunk_id_get

> api_v1_account_account_id_trunks_trunk_id_get(account_id, opts)

Retrieve a Trunk

Get details of a specific trunk.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json' # String | 
}

begin
  # Retrieve a Trunk
  api_instance.api_v1_account_account_id_trunks_trunk_id_get(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_get: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_trunk_id_get_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_trunk_id_get_with_http_info(account_id, opts)

```ruby
begin
  # Retrieve a Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_trunk_id_get_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_get_with_http_info: #{e}"
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


## api_v1_account_account_id_trunks_trunk_id_put

> api_v1_account_account_id_trunks_trunk_id_put(account_id, opts)

Update a Trunk

Update an existing trunk.

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

api_instance = Vobiz::TrunkApi.new
account_id = 'account_id_example' # String | 
opts = {
  x_auth_id: '{{auth_id}}', # String | 
  x_auth_token: '{{auth_token}}', # String | 
  content_type: 'application/json', # String | 
  body: { ... } # Object | 
}

begin
  # Update a Trunk
  api_instance.api_v1_account_account_id_trunks_trunk_id_put(account_id, opts)
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_put: #{e}"
end
```

#### Using the api_v1_account_account_id_trunks_trunk_id_put_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> api_v1_account_account_id_trunks_trunk_id_put_with_http_info(account_id, opts)

```ruby
begin
  # Update a Trunk
  data, status_code, headers = api_instance.api_v1_account_account_id_trunks_trunk_id_put_with_http_info(account_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Vobiz::ApiError => e
  puts "Error when calling TrunkApi->api_v1_account_account_id_trunks_trunk_id_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** |  |  |
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

