# Reference
## Account
<details><summary><code>client.account.<a href="/lib/vobiz/account/client.rb">retrieve_account</a>() -> Vobiz::Account::Types::RetrieveAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve complete account details including pricing tier and credentials.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.account.retrieve_account
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Vobiz::Account::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.account.<a href="/lib/vobiz/account/client.rb">get_concurrency</a>(auth_id) -> Vobiz::Account::Types::GetConcurrencyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the current concurrent call usage and configured limits.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.account.get_concurrency(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Account::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Balance
<details><summary><code>client.balance.<a href="/lib/vobiz/balance/client.rb">get_balance</a>(auth_id, currency) -> Vobiz::Balance::Types::GetBalanceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the current account balance for a specific currency.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.balance.get_balance(
  auth_id: "MA_XXXXXX",
  currency: "INR"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String` — Currency code (e.g. INR, USD)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Balance::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.balance.<a href="/lib/vobiz/balance/client.rb">list_transactions</a>(auth_id) -> Vobiz::Balance::Types::ListTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve paginated transaction history for the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.balance.list_transactions(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Balance::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Live Calls
<details><summary><code>client.live_calls.<a href="/lib/vobiz/live_calls/client.rb">list_queued_calls</a>(auth_id) -> Vobiz::LiveCalls::Types::ListQueuedCallsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all queued (pending, not yet connected) calls on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.live_calls.list_queued_calls(
  auth_id: "MA_XXXXXX",
  status: "live"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**status:** `Vobiz::LiveCalls::Types::ListQueuedCallsRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::LiveCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.live_calls.<a href="/lib/vobiz/live_calls/client.rb">list_live_calls</a>(auth_id) -> Vobiz::LiveCalls::Types::ListLiveCallsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all currently active (live) calls on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.live_calls.list_live_calls(
  auth_id: "MA_XXXXXX",
  status: "live"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**status:** `Vobiz::LiveCalls::Types::ListLiveCallsRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::LiveCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.live_calls.<a href="/lib/vobiz/live_calls/client.rb">get_live_call</a>(auth_id, call_uuid) -> Vobiz::LiveCalls::Types::GetLiveCallResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of a specific live or queued call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.live_calls.get_live_call(
  auth_id: "MA_XXXXXX",
  call_uuid: "cdr_XXXXXXXXXX",
  status: "live"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Vobiz::LiveCalls::Types::GetLiveCallRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::LiveCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.live_calls.<a href="/lib/vobiz/live_calls/client.rb">hangup_call</a>(auth_id, call_uuid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Terminate an active call by its UUID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.live_calls.hangup_call(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::LiveCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.live_calls.<a href="/lib/vobiz/live_calls/client.rb">get_queued_call</a>(auth_id, call_uuid) -> Vobiz::LiveCalls::Types::GetQueuedCallResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of a specific queued (pending) call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.live_calls.get_queued_call(
  auth_id: "MA_XXXXXX",
  call_uuid: "cdr_XXXXXXXXXX",
  status: "live"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Vobiz::LiveCalls::Types::GetQueuedCallRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::LiveCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Calls
<details><summary><code>client.calls.<a href="/lib/vobiz/calls/client.rb">make_call</a>(auth_id, request) -> Vobiz::Calls::Types::MakeCallResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Initiate an outbound call to a PSTN number or SIP endpoint.
Use `<` to separate multiple destinations (max 1000).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.calls.make_call(
  auth_id: "MA_XXXXXX",
  from: "14155551234",
  to: "+919876543210",
  answer_url: "https://example.com/answer",
  answer_method: "POST"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**answer_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**answer_method:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Calls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CDR
<details><summary><code>client.cdr.<a href="/lib/vobiz/cdr/client.rb">list_cdrs</a>(auth_id) -> Vobiz::Cdr::Types::ListCdrsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all CDRs for your account. Supports filtering by phone numbers,
date range, call direction, duration, and pagination.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cdr.list_cdrs(
  auth_id: "MA_XXXXXX",
  from_number: "9876543210",
  to_number: "1234567890",
  start_date: "2026-03-01",
  end_date: "2026-03-17",
  min_duration: 10,
  sip_call_id: "dD1qwu5VZ5iK3ed5u3uspjY5RKL",
  bridge_uuid: "4b7ae653-f40d-42f1-b582-6b05dfcd0c0a",
  hangup_cause: "NORMAL_CLEARING",
  hangup_disposition: "send_refuse",
  context: "sip-trunking"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**from_number:** `String` — Filter by the originating phone number (caller).
    
</dd>
</dl>

<dl>
<dd>

**to_number:** `String` — Filter by the destination phone number (callee).
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Beginning of the search period (YYYY-MM-DD). Required when using `end_date`.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End of the search period (YYYY-MM-DD). Required when using `start_date`.
    
</dd>
</dl>

<dl>
<dd>

**call_direction:** `Vobiz::Cdr::Types::ListCdrsRequestCallDirection` — Filter by direction.
    
</dd>
</dl>

<dl>
<dd>

**min_duration:** `Integer` — Minimum call duration in seconds. Excludes calls shorter than this value.
    
</dd>
</dl>

<dl>
<dd>

**sip_call_id:** `String` — Filter by the SIP Call-ID of the call (matches the cdr's sip_call_id field).
    
</dd>
</dl>

<dl>
<dd>

**bridge_uuid:** `String` — Filter by the UUID of the bridged leg (matches the cdr's bridge_uuid field).
    
</dd>
</dl>

<dl>
<dd>

**hangup_cause:** `String` — Filter by telephony hangup cause, e.g. NORMAL_CLEARING.
    
</dd>
</dl>

<dl>
<dd>

**hangup_disposition:** `String` — Filter by how the leg was released, e.g. send_refuse.
    
</dd>
</dl>

<dl>
<dd>

**context:** `String` — Filter by the call context, e.g. sip-trunking.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` — Filter by the campaign identifier associated with the call.
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` — Free-text search across CDR fields (numbers, IDs, etc.).
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page number for paginated results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of records per page. Max: 100.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Cdr::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cdr.<a href="/lib/vobiz/cdr/client.rb">search_cdrs</a>(auth_id) -> Vobiz::Cdr::Types::SearchCdrsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Identical filters to the list endpoint, but the response also includes a
`filter_summary` object describing the active filters applied.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cdr.search_cdrs(
  auth_id: "MA_XXXXXX",
  from_number: "9876543210",
  to_number: "1234567890",
  start_date: "2026-03-01",
  end_date: "2026-03-17",
  min_duration: 10,
  sip_call_id: "dD1qwu5VZ5iK3ed5u3uspjY5RKL",
  bridge_uuid: "4b7ae653-f40d-42f1-b582-6b05dfcd0c0a",
  hangup_cause: "NORMAL_CLEARING",
  hangup_disposition: "send_refuse",
  context: "sip-trunking"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**from_number:** `String` — Filter by the originating phone number (caller).
    
</dd>
</dl>

<dl>
<dd>

**to_number:** `String` — Filter by the destination phone number (callee).
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — Beginning of the search period (YYYY-MM-DD). Required when using `end_date`.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — End of the search period (YYYY-MM-DD). Required when using `start_date`.
    
</dd>
</dl>

<dl>
<dd>

**call_direction:** `Vobiz::Cdr::Types::SearchCdrsRequestCallDirection` — Filter by direction.
    
</dd>
</dl>

<dl>
<dd>

**min_duration:** `Integer` — Minimum call duration in seconds. Excludes calls shorter than this value.
    
</dd>
</dl>

<dl>
<dd>

**sip_call_id:** `String` — Filter by the SIP Call-ID of the call (matches the cdr's sip_call_id field).
    
</dd>
</dl>

<dl>
<dd>

**bridge_uuid:** `String` — Filter by the UUID of the bridged leg (matches the cdr's bridge_uuid field).
    
</dd>
</dl>

<dl>
<dd>

**hangup_cause:** `String` — Filter by telephony hangup cause, e.g. NORMAL_CLEARING.
    
</dd>
</dl>

<dl>
<dd>

**hangup_disposition:** `String` — Filter by how the leg was released, e.g. send_refuse.
    
</dd>
</dl>

<dl>
<dd>

**context:** `String` — Filter by the call context, e.g. sip-trunking.
    
</dd>
</dl>

<dl>
<dd>

**campaign_id:** `String` — Filter by the campaign identifier associated with the call.
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` — Free-text search across CDR fields (numbers, IDs, etc.).
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` — Page number for paginated results.
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` — Number of records per page. Max: 100.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Cdr::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cdr.<a href="/lib/vobiz/cdr/client.rb">list_recent_cdrs</a>(auth_id) -> Vobiz::Cdr::Types::ListRecentCdrsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the most recent CDRs for your account without requiring a date range.
Default 20 records; use `limit` to retrieve more.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cdr.list_recent_cdrs(
  auth_id: "MA_XXXXXX",
  limit: 50
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Number of recent CDRs to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Cdr::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cdr.<a href="/lib/vobiz/cdr/client.rb">get_cdr</a>(auth_id, call_id) -> Vobiz::Cdr::Types::GetCdrResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the CDR for a specific completed call using its `call_id`.
Useful when you have a `call_id` from a callback or previous API response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cdr.get_cdr(
  auth_id: "MA_XXXXXX",
  call_id: "abc123-def456-ghi789"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_id:** `String` — The unique call ID of the completed call.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Cdr::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sub-Accounts
<details><summary><code>client.sub_accounts.<a href="/lib/vobiz/sub_accounts/client.rb">list_subaccounts</a>(auth_id) -> Vobiz::SubAccounts::Types::ListSubaccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all sub-accounts under the master account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_accounts.list_subaccounts(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_accounts.<a href="/lib/vobiz/sub_accounts/client.rb">create_subaccount</a>(auth_id, request) -> Vobiz::SubAccounts::Types::CreateSubaccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new sub-account under the master account.

Set `kyc_mode` to control how the sub-account is verified:

- `personal_use` *(default)* — the sub-account inherits the parent's
  KYC; no separate verification is required.
- `customer_use` — the sub-account must complete its own KYC before it
  can place calls. A fresh `customer_use` sub-account is returned with
  `kyc_calls_blocked: true`. `customer_use` **requires** `email`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_accounts.create_subaccount(
  auth_id: "MA_XXXXXX",
  name: "Customer Co",
  email: "customer@example.com",
  password: "Customer@12345",
  kyc_mode: "customer_use",
  business_type: "private_limited"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Human-readable name for the sub-account.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Required when `kyc_mode` is `customer_use`.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — Login password for the sub-account.
    
</dd>
</dl>

<dl>
<dd>

**kyc_mode:** `Vobiz::SubAccounts::Types::CreateSubaccountRequestKycMode` 

`personal_use` inherits parent KYC. `customer_use` requires
the sub-account to complete its own KYC and requires `email`.
    
</dd>
</dl>

<dl>
<dd>

**business_type:** `Vobiz::SubAccounts::Types::CreateSubaccountRequestBusinessType` — Legal constitution of the customer. Drives which KYC documents are required.
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_accounts.<a href="/lib/vobiz/sub_accounts/client.rb">retrieve_subaccount</a>(auth_id, sub_auth_id) -> Vobiz::SubAccounts::Types::RetrieveSubaccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve details of a specific sub-account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_accounts.retrieve_subaccount(
  auth_id: "MA_XXXXXX",
  sub_auth_id: "SA_XXXXXX"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**sub_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_accounts.<a href="/lib/vobiz/sub_accounts/client.rb">update_subaccount</a>(auth_id, sub_auth_id, request) -> Vobiz::SubAccounts::Types::UpdateSubaccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the name or status of a sub-account, or change its `kyc_mode`.

Promoting an existing sub-account to `customer_use` requires the
sub-account to already have an `email` (otherwise `400`). On any
`kyc_mode` change, `kyc_calls_blocked` is re-derived from the
sub-account's current KYC state.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_accounts.update_subaccount(
  auth_id: "MA_XXXXXX",
  sub_auth_id: "sub_auth_id",
  kyc_mode: "customer_use"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**sub_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**kyc_mode:** `Vobiz::SubAccounts::Types::UpdateSubaccountRequestKycMode` — Change the verification mode. Promoting to `customer_use` requires the sub-account to have an `email`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_accounts.<a href="/lib/vobiz/sub_accounts/client.rb">delete_subaccount</a>(auth_id, sub_auth_id) -> Vobiz::SubAccounts::Types::DeleteSubaccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a sub-account and revoke its credentials.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_accounts.delete_subaccount(
  auth_id: "MA_XXXXXX",
  sub_auth_id: "sub_auth_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**sub_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sub-Account KYC
<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">get_subaccount_kyc_status</a>(sub_auth_id) -> Vobiz::Types::SubAccountKycStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the aggregated KYC state for a `customer_use` sub-account —
which verifications have passed, whether calls are still blocked, and
the business type. The caller must be the parent main account that owns
the sub-account (or an admin).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.get_subaccount_kyc_status(sub_auth_id: "SA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">verify_subaccount_pan</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Runs a real PAN verification (Perfios) for the sub-account. `pan` must
be exactly 10 characters. Persists a `kyc_verifications` row and
recomputes the sub-account's aggregated `kyc_status`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.verify_subaccount_pan(
  sub_auth_id: "SA_XXXXXX",
  pan: "ABCDE1234F"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**pan:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">verify_subaccount_gst</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Runs a real GSTIN verification. `gstin` must be a 15-character GSTIN.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.verify_subaccount_gst(
  sub_auth_id: "SA_XXXXXX",
  gstin: "29AAJCN5983D1Z0"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**gstin:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">search_subaccount_cin</a>(sub_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Name-based CIN lookup. Returns candidate company matches; pick one and
pass it to [CIN confirm](#operation/confirm-subaccount-cin).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.search_subaccount_cin(
  sub_auth_id: "SA_XXXXXX",
  company_name: "ACME PRIVATE LIMITED"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**company_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">confirm_subaccount_cin</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Confirm the CIN selected from the search results.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.confirm_subaccount_cin(
  sub_auth_id: "SA_XXXXXX",
  company_name: "ACME PRIVATE LIMITED",
  selected_cin: "U72900KA2024PTC123456"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**company_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**selected_cin:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">subaccount_digilocker_initiate</a>(sub_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the DigiLocker authorization link and an `access_request_id`.
The customer completes the OAuth flow on the DigiLocker portal, after
which you finalize with
[DigiLocker verify](#operation/subaccount-digilocker-verify).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.subaccount_digilocker_initiate(
  sub_auth_id: "SA_XXXXXX",
  redirect_url: "https://partner.example.com/kyc/callback"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**redirect_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**oauth_state:** `String` — Opaque value echoed back on the redirect for CSRF protection.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">subaccount_digilocker_verify</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Finalize Aadhaar via DigiLocker after the customer completes OAuth.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.subaccount_digilocker_verify(
  sub_auth_id: "SA_XXXXXX",
  access_request_id: "AR_xxxxxxxx"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**access_request_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**linked_number:** `String` — Optional. Binds the Aadhaar to a specific number (92-series).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc.<a href="/lib/vobiz/sub_account_kyc/client.rb">create_subaccount_kyc_session</a>(sub_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Vobiz-hosted KYC session for the sub-account. With
`flow_type=email` (default) Vobiz emails the customer a signed link
(from `kyc@vobiz.ai`, hosted at `kyc.vobiz.ai`) and `customer_email` is
required. With `flow_type=redirect`, omit `customer_email`, pass a
`redirect_url`, and the `widget_url` is returned directly for an inline
redirect.

This is the sub-account–scoped equivalent of the partner-level
[KYC Sessions](/partner/api/kyc-sessions) endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc.create_subaccount_kyc_session(
  sub_auth_id: "SA_XXXXXX",
  account_auth_id: "SA_XXXXXX",
  flow_type: "email",
  customer_email: "customer@example.com",
  webhook_url: "https://your-app.example.com/kyc/webhook",
  expires_in_days: 30
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**account_auth_id:** `String` — The sub-account's auth_id (typically equal to the path `sub_auth_id`).
    
</dd>
</dl>

<dl>
<dd>

**flow_type:** `Vobiz::SubAccountKyc::Types::CreateSubaccountKycSessionRequestFlowType` 
    
</dd>
</dl>

<dl>
<dd>

**customer_email:** `String` — Required when `flow_type` is `email`.
    
</dd>
</dl>

<dl>
<dd>

**redirect_url:** `String` 

Required when `flow_type` is `redirect`. After verification the customer's
browser is sent to this URL.
    
</dd>
</dl>

<dl>
<dd>

**webhook_url:** `String` — HTTPS endpoint VoBiz POSTs the KYC result to. Omit it and no callbacks are sent.
    
</dd>
</dl>

<dl>
<dd>

**expires_in_days:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKyc::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sub-Account KYC (Test Mode)
<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_verify_subaccount_pan</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mock PAN verification — never hits the provider. Magic `pan` inputs:

| Input | Outcome |
|---|---|
| `TESTSUCCESS0001` | verified |
| `TESTFAIL0001` | failed |
| `TESTERROR0001` | HTTP 500 |
| `TESTPENDING001` | pending (finalize as verified) |
| `TESTPENDING_FAIL` | pending (finalize as failed) |

Persists a real `kyc_verifications` row and recomputes `kyc_status`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_verify_subaccount_pan(
  sub_auth_id: "SA_XXXXXX",
  pan: "TESTSUCCESS0001"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**pan:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_verify_subaccount_gst</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mock GST verification. Same magic-input matrix as [Mock verify PAN](#operation/mock-verify-subaccount-pan).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_verify_subaccount_gst(
  sub_auth_id: "SA_XXXXXX",
  gstin: "TESTSUCCESS0001GST"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**gstin:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_search_subaccount_cin</a>(sub_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns deterministic fake company matches.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_search_subaccount_cin(
  sub_auth_id: "SA_XXXXXX",
  company_name: "ACME"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**company_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_confirm_subaccount_cin</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Succeeds when `selected_cin` starts with `U72900KA2024PTC123456`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_confirm_subaccount_cin(
  sub_auth_id: "SA_XXXXXX",
  company_name: "ACME",
  selected_cin: "U72900KA2024PTC123456"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**company_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**selected_cin:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_subaccount_digilocker_initiate</a>(sub_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a deterministic `access_request_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_subaccount_digilocker_initiate(
  sub_auth_id: "SA_XXXXXX",
  redirect_url: "https://partner.example.com/kyc/callback"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**redirect_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_subaccount_digilocker_verify</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`access_request_id` `MOCK_AR_SUCCESS` → verified; `MOCK_AR_FAIL` → failed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_subaccount_digilocker_verify(
  sub_auth_id: "SA_XXXXXX",
  access_request_id: "MOCK_AR_SUCCESS"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**access_request_id:** `Vobiz::SubAccountKycTestMode::Types::MockSubaccountDigilockerVerifyRequestAccessRequestID` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sub_account_kyc_test_mode.<a href="/lib/vobiz/sub_account_kyc_test_mode/client.rb">mock_finalize_pending_kyc</a>(sub_auth_id, request) -> Vobiz::Types::KycVerificationResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Promotes the most recent **pending** mock verification of the given
type to a terminal outcome — this drives the async (`TESTPENDING…`)
path without webhooks. `verification_type` ∈ `pan | aadhaar | gst | cin`;
`outcome` ∈ `verified | failed`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sub_account_kyc_test_mode.mock_finalize_pending_kyc(
  sub_auth_id: "SA_XXXXXX",
  verification_type: "pan",
  outcome: "verified"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sub_auth_id:** `String` — The sub-account's Auth ID.
    
</dd>
</dl>

<dl>
<dd>

**verification_type:** `Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequestVerificationType` 
    
</dd>
</dl>

<dl>
<dd>

**outcome:** `Vobiz::SubAccountKycTestMode::Types::MockFinalizePendingKycRequestOutcome` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SubAccountKycTestMode::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Phone Numbers
<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">list_numbers</a>(auth_id) -> Vobiz::PhoneNumbers::Types::ListNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all phone numbers on your account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.list_numbers(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">unrent_number</a>(auth_id, e164) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Release a phone number from your account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.unrent_number(
  auth_id: "MA_XXXXXX",
  e164: "919876543210"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**e164:** `String` — Phone number in E.164 format (without the +)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">list_inventory_numbers</a>(auth_id) -> Vobiz::PhoneNumbers::Types::ListInventoryNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Browse available phone numbers in inventory that are not assigned to
any account. Only numbers with `status='active'` and `auth_id=NULL`
are returned. These numbers are ready to be purchased.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.list_inventory_numbers(
  auth_id: "MA_XXXXXX",
  country: "IN",
  exclude: "9180,9192"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Filter by country code (e.g., "US", "IN").
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` — Substring match against the E.164 number (e.g., "80" matches "+918065...").
    
</dd>
</dl>

<dl>
<dd>

**exclude:** `String` — One or more E.164 prefixes to remove from results. Include the country code (e.g. "9180" for India +91 80-series, "1415" for US +1 415); a leading "+" is optional. Matched against the full E.164 form, so it works for any country. Accepts a comma-separated list ("9180,9192") or repeated params ("exclude=9180&exclude=9192"), and the two forms can be combined. It is ANDed with all other filters, so it takes priority over `search`; duplicates are de-duplicated silently and `total` reflects the filtered result set.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">purchase_from_inventory</a>(auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Purchase a phone number from inventory and assign it to your account.
Debits your account balance for the setup fee and monthly fee. For
sub-accounts (SA_), the parent master account (MA_) is charged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.purchase_from_inventory(
  auth_id: "MA_XXXXXX",
  e164: "+919876543210",
  currency: "USD"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**e164:** `String` — Phone number to purchase in E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String` — Currency for transaction. Defaults to the number's currency or "USD".
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">assign_number_to_trunk</a>(auth_id, phone_number, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign a phone number to a specific SIP trunk. Once assigned, all
inbound calls to that phone number will be routed through the
designated trunk. The phone number must be URL-encoded; use `%2B`
instead of `+` (e.g., `%2B912271264217`).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.assign_number_to_trunk(
  auth_id: "MA_XXXXXX",
  phone_number: "%2B912271264217",
  trunk_group_id: "e3e55a78-1234-5678-90ab-cdef12345678"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — The phone number to assign, URL-encoded (use %2B instead of +).
    
</dd>
</dl>

<dl>
<dd>

**trunk_group_id:** `String` — The UUID of the trunk to assign this number to.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">unassign_number_from_trunk</a>(auth_id, phone_number) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove the assignment between a phone number and a SIP trunk. After
unassignment, the number remains in your account inventory but will
no longer route inbound calls through the previously assigned trunk.
URL-encode the phone number (use `%2B` instead of `+`).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.unassign_number_from_trunk(
  auth_id: "MA_XXXXXX",
  phone_number: "%2B912271264217"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — The phone number to unassign, URL-encoded (use %2B instead of +).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">get_number_health</a>(auth_id, e164) -> Vobiz::PhoneNumbers::Types::GetNumberHealthResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the health & analytics dashboard for one of your numbers: current
status, spam flag, and call metrics over the selected window (total and
answered calls, answer rate, minutes, average duration) plus a per-period
time series of snapshots.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.get_number_health(
  auth_id: "MA_XXXXXX",
  e164: "%2B919876543210",
  days: 30
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**e164:** `String` — The number in E.164, URL-encoded (use %2B instead of +).
    
</dd>
</dl>

<dl>
<dd>

**granularity:** `Vobiz::PhoneNumbers::Types::GetNumberHealthRequestGranularity` — Snapshot granularity.
    
</dd>
</dl>

<dl>
<dd>

**days:** `Integer` — Size of the window (in days) for the summary and snapshots.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">assign_did_to_subaccount</a>(auth_id, e164, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assign a parent-pool DID to a sub-account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.assign_did_to_subaccount(
  auth_id: "MA_XXXXXX",
  e164: "%2B919876543210",
  sub_account_id: "SA_XXXXXX"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**e164:** `String` — The number in E.164, URL-encoded (use %2B instead of +).
    
</dd>
</dl>

<dl>
<dd>

**sub_account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.phone_numbers.<a href="/lib/vobiz/phone_numbers/client.rb">unassign_did_from_subaccount</a>(auth_id, e164) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Move the DID back to the parent pool.

A **15-day cool-off** is enforced: if the DID had a call within the last
15 days, the request is rejected with `409` and a
`did_cool_off_in_effect` error that includes `cool_off_until` and
`cool_off_remaining_seconds`. Never-used DIDs (`last_call_at` is `NULL`)
move back immediately.

Admins can bypass the cool-off with `?force=true` (see below); the
bypass writes a `did_assignment_audit` row and requires an
admin-role account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.phone_numbers.unassign_did_from_subaccount(
  auth_id: "MA_XXXXXX",
  e164: "%2B919876543210",
  force: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**e164:** `String` — The number in E.164, URL-encoded (use %2B instead of +).
    
</dd>
</dl>

<dl>
<dd>

**force:** `Internal::Types::Boolean` 

Admin-only cool-off bypass. Requires an admin-role account
(enforced at the gateway) and writes a `did_assignment_audit` row.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PhoneNumbers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Trunks
<details><summary><code>client.trunks.<a href="/lib/vobiz/trunks/client.rb">list_trunks</a>(auth_id) -> Vobiz::Trunks::Types::ListTrunksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all SIP trunks configured on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.trunks.list_trunks(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Trunks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trunks.<a href="/lib/vobiz/trunks/client.rb">create_trunk</a>(auth_id, request) -> Vobiz::Trunks::Types::CreateTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new SIP trunk for inbound or outbound calling.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.trunks.create_trunk(
  auth_id: "MA_XXXXXX",
  name: "Retell AI SIP",
  trunk_direction: "outbound",
  transport: "udp",
  concurrent_calls_limit: 50,
  cps_limit: 15,
  credential_uuid: "b1e2...",
  ipacl_uuid: "c3d4...",
  recording: true,
  enable_transcription: true,
  webhook_url: "https://example.com/vobiz/webhook",
  webhook_method: "POST"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Trunk name.
    
</dd>
</dl>

<dl>
<dd>

**trunk_direction:** `Vobiz::Trunks::Types::CreateTrunkRequestTrunkDirection` — Direction of the trunk — **`inbound` or `outbound` only** (a trunk is one direction, not both).
    
</dd>
</dl>

<dl>
<dd>

**trunk_status:** `Vobiz::Trunks::Types::CreateTrunkRequestTrunkStatus` — Trunk status — `enabled` or `disabled` (note: not `active`).
    
</dd>
</dl>

<dl>
<dd>

**secure:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**trunk_domain:** `String` — SIP domain. Auto-generated as `{first8ofUUID}.sip.vobiz.ai` if omitted.
    
</dd>
</dl>

<dl>
<dd>

**transport:** `Vobiz::Trunks::Types::CreateTrunkRequestTransport` 
    
</dd>
</dl>

<dl>
<dd>

**inbound_destination:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**concurrent_calls_limit:** `Integer` — Stored on the trunk. The **enforced** concurrency limit is account-level (account base + channel subscriptions), not this field.
    
</dd>
</dl>

<dl>
<dd>

**cps_limit:** `Integer` — Stored on the trunk. The **enforced** CPS is account-level, not this field.
    
</dd>
</dl>

<dl>
<dd>

**credential_uuid:** `String` — Attach an existing SIP credential (username / password / realm) by UUID.
    
</dd>
</dl>

<dl>
<dd>

**ipacl_uuid:** `String` — Attach an existing IP access-control list (IP-based auth) by UUID.
    
</dd>
</dl>

<dl>
<dd>

**primary_uri_uuid:** `String` — Primary origination URI UUID.
    
</dd>
</dl>

<dl>
<dd>

**fallback_uri_uuid:** `String` — Fallback origination URI UUID.
    
</dd>
</dl>

<dl>
<dd>

**recording:** `Internal::Types::Boolean` — Enable call recording.
    
</dd>
</dl>

<dl>
<dd>

**enable_transcription:** `Internal::Types::Boolean` — Auto-transcribe recordings when `recording=true`.
    
</dd>
</dl>

<dl>
<dd>

**pii_redaction:** `Internal::Types::Boolean` — Redact PII from transcriptions.
    
</dd>
</dl>

<dl>
<dd>

**pii_entity_types:** `String` — Comma-separated list of entity types to redact.
    
</dd>
</dl>

<dl>
<dd>

**webhook_url:** `String` 

Customer webhook for call-admission events (`CallInitiated` / `Hangup`).
Must be a valid **public** http/https URL. SSRF-validated — localhost,
private (RFC1918), and cloud-metadata (`169.254.169.254`) URLs are
rejected with `invalid webhook_url`. See [Trunk Webhooks](/trunks/webhook).
    
</dd>
</dl>

<dl>
<dd>

**webhook_method:** `Vobiz::Trunks::Types::CreateTrunkRequestWebhookMethod` — HTTP method for the webhook callback.
    
</dd>
</dl>

<dl>
<dd>

**recording_webhook_enabled:** `Internal::Types::Boolean` — Fire a `recording.completed` webhook to `webhook_url` after a recording is saved.
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` — Deprecated — use `credential_uuid`.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — Deprecated — use `credential_uuid`.
    
</dd>
</dl>

<dl>
<dd>

**ip_whitelist:** `Internal::Types::Array[String]` — Deprecated — use `ipacl_uuid`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Trunks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trunks.<a href="/lib/vobiz/trunks/client.rb">retrieve_trunk</a>(auth_id, trunk_id) -> Vobiz::Trunks::Types::RetrieveTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details of a specific SIP trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.trunks.retrieve_trunk(
  auth_id: "MA_XXXXXX",
  trunk_id: "trunk_XXXXXX"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**trunk_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Trunks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trunks.<a href="/lib/vobiz/trunks/client.rb">update_trunk</a>(auth_id, trunk_id, request) -> Vobiz::Trunks::Types::UpdateTrunkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a SIP trunk's name, configuration, or status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.trunks.update_trunk(
  auth_id: "MA_XXXXXX",
  trunk_id: "trunk_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**trunk_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**trunk_direction:** `Vobiz::Trunks::Types::UpdateTrunkRequestTrunkDirection` — Direction of the trunk — `inbound` or `outbound` only.
    
</dd>
</dl>

<dl>
<dd>

**trunk_status:** `Vobiz::Trunks::Types::UpdateTrunkRequestTrunkStatus` 
    
</dd>
</dl>

<dl>
<dd>

**secure:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**trunk_domain:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**transport:** `Vobiz::Trunks::Types::UpdateTrunkRequestTransport` 
    
</dd>
</dl>

<dl>
<dd>

**inbound_destination:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**concurrent_calls_limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**cps_limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**credential_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ipacl_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**primary_uri_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**fallback_uri_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**recording:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**enable_transcription:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**pii_redaction:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**pii_entity_types:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_url:** `String` — Customer webhook for call-admission events (`CallInitiated` / `Hangup`). Public http/https URL; SSRF-validated. See [Trunk Webhooks](/trunks/webhook).
    
</dd>
</dl>

<dl>
<dd>

**webhook_method:** `Vobiz::Trunks::Types::UpdateTrunkRequestWebhookMethod` 
    
</dd>
</dl>

<dl>
<dd>

**recording_webhook_enabled:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Trunks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trunks.<a href="/lib/vobiz/trunks/client.rb">delete_trunk</a>(auth_id, trunk_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a SIP trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.trunks.delete_trunk(
  auth_id: "MA_XXXXXX",
  trunk_id: "trunk_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**trunk_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Trunks::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Conference
<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">kick_member</a>(auth_id, conference_name, member_id) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a specific participant from a conference call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.kick_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">hangup_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disconnect a specific member from a conference.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.hangup_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">play_audio_member</a>(auth_id, conference_name, member_id, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Play an audio file to a specific conference member.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.play_audio_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id",
  url: "https://example.com/audio.mp3"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**url:** `String` — URL of the audio file to play
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">stop_audio_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop audio playback for a specific conference member.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.stop_audio_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">deaf_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Prevent a conference member from hearing other participants.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.deaf_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference.<a href="/lib/vobiz/conference/client.rb">undeaf_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Restore a conference member's ability to hear other participants.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference.undeaf_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conference::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## RecordCalls
<details><summary><code>client.record_calls.<a href="/lib/vobiz/record_calls/client.rb">start_recording</a>(auth_id, call_uuid, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Begin recording an active call. Set format, enable transcription, and configure a callback URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.record_calls.start_recording(
  auth_id: "MA_XXXXXX",
  call_uuid: "cdr_XXXXXXXXXX",
  time_limit: 120,
  file_format: "mp3"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**time_limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**file_format:** `Vobiz::RecordCalls::Types::StartRecordingRequestFileFormat` 
    
</dd>
</dl>

<dl>
<dd>

**transcription_type:** `String` — Set to `auto` to enable transcription
    
</dd>
</dl>

<dl>
<dd>

**callback_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**record_channel_type:** `Vobiz::RecordCalls::Types::StartRecordingRequestRecordChannelType` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::RecordCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.record_calls.<a href="/lib/vobiz/record_calls/client.rb">stop_recording</a>(auth_id, call_uuid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop an active recording on an in-progress call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.record_calls.stop_recording(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::RecordCalls::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PlayAudio
<details><summary><code>client.play_audio.<a href="/lib/vobiz/play_audio/client.rb">call</a>(auth_id, call_uuid, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Play an audio file to a live call leg.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.play_audio.call(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  urls: "https://example.com/audio.mp3",
  legs: "aleg"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**urls:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**legs:** `Vobiz::PlayAudio::Types::PlayAudioCallRequestLegs` 
    
</dd>
</dl>

<dl>
<dd>

**loop:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PlayAudio::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.play_audio.<a href="/lib/vobiz/play_audio/client.rb">stop_audio_call</a>(auth_id, call_uuid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop audio playing on a live call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.play_audio.stop_audio_call(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PlayAudio::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SpeakText
<details><summary><code>client.speak_text.<a href="/lib/vobiz/speak_text/client.rb">call</a>(auth_id, call_uuid, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert text to speech and play it on a live call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.speak_text.call(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  text: "Hello, your appointment is confirmed for tomorrow at 3 PM.",
  voice: "WOMAN",
  language: "en-US"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**text:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**voice:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**language:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**legs:** `Vobiz::SpeakText::Types::SpeakTextCallRequestLegs` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SpeakText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.speak_text.<a href="/lib/vobiz/speak_text/client.rb">stop_speak_call</a>(auth_id, call_uuid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop ongoing TTS playback on a live call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.speak_text.stop_speak_call(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::SpeakText::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Dtmf
<details><summary><code>client.dtmf.<a href="/lib/vobiz/dtmf/client.rb">send_dtmf</a>(auth_id, call_uuid, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send DTMF (keypad) tones on an active call. Use `w` for 0.5s pause, `W` for 1s pause.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.dtmf.send_dtmf(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  digits: "1234",
  leg: "aleg"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**digits:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**leg:** `Vobiz::Dtmf::Types::SendDtmfRequestLeg` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Dtmf::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AudioStreams
<details><summary><code>client.audio_streams.<a href="/lib/vobiz/audio_streams/client.rb">list_streams</a>(auth_id, call_uuid) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all audio streams on a live call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audio_streams.list_streams(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::AudioStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audio_streams.<a href="/lib/vobiz/audio_streams/client.rb">start_stream</a>(auth_id, call_uuid, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Start streaming raw audio from a live call to a WebSocket URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audio_streams.start_stream(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  service_url: "wss://your-server.com/ws",
  bidirectional: true,
  audio_track: "both"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**service_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**bidirectional:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**audio_track:** `Vobiz::AudioStreams::Types::StartStreamRequestAudioTrack` 
    
</dd>
</dl>

<dl>
<dd>

**audio_format:** `Vobiz::AudioStreams::Types::StartStreamRequestAudioFormat` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::AudioStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audio_streams.<a href="/lib/vobiz/audio_streams/client.rb">get_stream</a>(auth_id, call_uuid, stream_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details of a specific audio stream.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audio_streams.get_stream(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  stream_id: "stream_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**stream_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::AudioStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audio_streams.<a href="/lib/vobiz/audio_streams/client.rb">stop_stream</a>(auth_id, call_uuid, stream_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop a specific audio stream on a live call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.audio_streams.stop_stream(
  auth_id: "MA_XXXXXX",
  call_uuid: "call_uuid",
  stream_id: "stream_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**call_uuid:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**stream_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::AudioStreams::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Conferences
<details><summary><code>client.conferences.<a href="/lib/vobiz/conferences/client.rb">list_conferences</a>(auth_id) -> Vobiz::Conferences::Types::ListConferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all active conference rooms on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conferences.list_conferences(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conferences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conferences.<a href="/lib/vobiz/conferences/client.rb">delete_all_conferences</a>(auth_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Terminate all active conference rooms.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conferences.delete_all_conferences(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conferences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conferences.<a href="/lib/vobiz/conferences/client.rb">get_conference</a>(auth_id, conference_name) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details and member list of a specific conference room.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conferences.get_conference(
  auth_id: "MA_XXXXXX",
  conference_name: "My Conf Room"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conferences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conferences.<a href="/lib/vobiz/conferences/client.rb">delete_conference</a>(auth_id, conference_name) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Terminate a specific conference room and disconnect all members.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conferences.delete_conference(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Conferences::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ConferenceMembers
<details><summary><code>client.conference_members.<a href="/lib/vobiz/conference_members/client.rb">mute_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Prevent a member from speaking. Use `all` as member_id to mute everyone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference_members.mute_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` — Member ID, comma-separated IDs, or `all`
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::ConferenceMembers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference_members.<a href="/lib/vobiz/conference_members/client.rb">unmute_member</a>(auth_id, conference_name, member_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Allow a muted member to speak again.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference_members.unmute_member(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name",
  member_id: "member_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**member_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::ConferenceMembers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ConferenceRecording
<details><summary><code>client.conference_recording.<a href="/lib/vobiz/conference_recording/client.rb">start_conference_recording</a>(auth_id, conference_name, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Begin recording all audio in a conference room.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference_recording.start_conference_recording(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**file_format:** `Vobiz::ConferenceRecording::Types::StartConferenceRecordingRequestFileFormat` 
    
</dd>
</dl>

<dl>
<dd>

**callback_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::ConferenceRecording::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.conference_recording.<a href="/lib/vobiz/conference_recording/client.rb">stop_conference_recording</a>(auth_id, conference_name) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Stop recording a conference room.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.conference_recording.stop_conference_recording(
  auth_id: "MA_XXXXXX",
  conference_name: "conference_name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**conference_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::ConferenceRecording::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Recordings
<details><summary><code>client.recordings.<a href="/lib/vobiz/recordings/client.rb">list_recordings</a>(auth_id) -> Vobiz::Recordings::Types::ListRecordingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all call recordings on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.recordings.list_recordings(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Recordings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.recordings.<a href="/lib/vobiz/recordings/client.rb">get_recording</a>(auth_id, recording_id) -> Vobiz::Recordings::Types::GetRecordingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details and download URL for a specific recording.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.recordings.get_recording(
  auth_id: "MA_XXXXXX",
  recording_id: "rec_XXXXXXXXXX"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**recording_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Recordings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.recordings.<a href="/lib/vobiz/recordings/client.rb">delete_recording</a>(auth_id, recording_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a recording from the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.recordings.delete_recording(
  auth_id: "MA_XXXXXX",
  recording_id: "recording_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**recording_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Recordings::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Credentials
<details><summary><code>client.credentials.<a href="/lib/vobiz/credentials/client.rb">create_credential</a>(auth_id, request) -> Vobiz::Credentials::Types::CreateCredentialResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create SIP credentials for trunk authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentials.create_credential(
  auth_id: "MA_XXXXXX",
  username: "myuser",
  password: "securepassword123"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentials.<a href="/lib/vobiz/credentials/client.rb">list_credentials</a>(auth_id) -> Vobiz::Credentials::Types::ListCredentialsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all SIP credentials on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentials.list_credentials(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentials.<a href="/lib/vobiz/credentials/client.rb">update_credential</a>(auth_id, credential_id, request) -> Vobiz::Credentials::Types::UpdateCredentialResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the password for an existing SIP credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentials.update_credential(
  auth_id: "MA_XXXXXX",
  credential_id: "credential_id",
  password: "password"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**credential_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credentials.<a href="/lib/vobiz/credentials/client.rb">delete_credential</a>(auth_id, credential_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an existing SIP credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credentials.delete_credential(
  auth_id: "MA_XXXXXX",
  credential_id: "credential_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**credential_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Credentials::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## IPAccessControlList
<details><summary><code>client.ip_access_control_list.<a href="/lib/vobiz/ip_access_control_list/client.rb">create_ip_acl</a>(auth_id, request) -> Vobiz::IPAccessControlList::Types::CreateIpAclResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add an IP access control rule to restrict SIP trunk access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.ip_access_control_list.create_ip_acl(
  auth_id: "MA_XXXXXX",
  name: "Office IP",
  ip_address: "ip_address"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::IPAccessControlList::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ip_access_control_list.<a href="/lib/vobiz/ip_access_control_list/client.rb">list_ip_acls</a>(auth_id) -> Vobiz::IPAccessControlList::Types::ListIpAclsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all IP access control rules on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.ip_access_control_list.list_ip_acls(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::IPAccessControlList::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ip_access_control_list.<a href="/lib/vobiz/ip_access_control_list/client.rb">update_ip_acl</a>(auth_id, ip_acl_id, request) -> Vobiz::IPAccessControlList::Types::UpdateIpAclResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing IP access control rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.ip_access_control_list.update_ip_acl(
  auth_id: "MA_XXXXXX",
  ip_acl_id: "ip_acl_id",
  name: "name",
  ip_address: "ip_address"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**ip_acl_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ip_address:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::IPAccessControlList::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ip_access_control_list.<a href="/lib/vobiz/ip_access_control_list/client.rb">delete_ip_acl</a>(auth_id, ip_acl_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an IP access control rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.ip_access_control_list.delete_ip_acl(
  auth_id: "MA_XXXXXX",
  ip_acl_id: "ip_acl_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**ip_acl_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::IPAccessControlList::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OriginationURI
<details><summary><code>client.origination_uri.<a href="/lib/vobiz/origination_uri/client.rb">create_origination_uri</a>(auth_id, request) -> Vobiz::OriginationURI::Types::CreateOriginationURIResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add an inbound SIP endpoint (origination URI) to a trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.origination_uri.create_origination_uri(
  auth_id: "MA_XXXXXX",
  name: "Primary SBC",
  sip_uri: "sip:sbc.example.com",
  priority: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**sip_uri:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::OriginationURI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.origination_uri.<a href="/lib/vobiz/origination_uri/client.rb">list_origination_uris</a>(auth_id) -> Vobiz::OriginationURI::Types::ListOriginationURIsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all origination URIs on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.origination_uri.list_origination_uris(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::OriginationURI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.origination_uri.<a href="/lib/vobiz/origination_uri/client.rb">update_origination_uri</a>(auth_id, uri_id, request) -> Vobiz::OriginationURI::Types::UpdateOriginationURIResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing origination URI.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.origination_uri.update_origination_uri(
  auth_id: "MA_XXXXXX",
  uri_id: "uri_id",
  name: "name",
  priority: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**uri_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::OriginationURI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.origination_uri.<a href="/lib/vobiz/origination_uri/client.rb">delete_origination_uri</a>(auth_id, uri_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an origination URI from a trunk.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.origination_uri.delete_origination_uri(
  auth_id: "MA_XXXXXX",
  uri_id: "uri_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**uri_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::OriginationURI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Applications
<details><summary><code>client.applications.<a href="/lib/vobiz/applications/client.rb">list_applications</a>(auth_id) -> Vobiz::Applications::Types::ListApplicationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details of all applications created under your Vobiz account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.applications.list_applications(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Applications::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.applications.<a href="/lib/vobiz/applications/client.rb">create_application</a>(auth_id, request) -> Vobiz::Applications::Types::CreateApplicationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an Application with webhook URLs for call handling.
Creating an application is usually a first step, after which you
attach the application to either a number or an endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.applications.create_application(
  auth_id: "MA_XXXXXX",
  app_name: "My Voice Application",
  answer_url: "https://example.com/answer",
  answer_method: "POST"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**app_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**answer_url:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**answer_method:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Applications::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.applications.<a href="/lib/vobiz/applications/client.rb">retrieve_application</a>(auth_id, app_id) -> Vobiz::Applications::Types::RetrieveApplicationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details of a particular application by passing the app_id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.applications.retrieve_application(
  auth_id: "MA_XXXXXX",
  app_id: "12345678"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**app_id:** `String` — Unique identifier for the application
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Applications::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.applications.<a href="/lib/vobiz/applications/client.rb">update_application</a>(auth_id, app_id, request) -> Vobiz::Applications::Types::UpdateApplicationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Modify an application using this API. You can update any subset of
fields (partial update). Fields not provided will remain unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.applications.update_application(
  auth_id: "MA_XXXXXX",
  app_id: "12345678",
  app_name: "Updated Application Name",
  default_number_app: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**app_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**app_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**default_number_app:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Applications::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.applications.<a href="/lib/vobiz/applications/client.rb">delete_application</a>(auth_id, app_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete an Application. If the application is associated
with phone numbers, the deletion may be blocked unless those
associations are removed first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.applications.delete_application(
  auth_id: "MA_XXXXXX",
  app_id: "12345678"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**app_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Applications::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Endpoints
<details><summary><code>client.endpoints.<a href="/lib/vobiz/endpoints/client.rb">list_endpoints</a>(auth_id) -> Vobiz::Endpoints::Types::ListEndpointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a paginated list of all SIP endpoints in your account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.endpoints.list_endpoints(auth_id: "MA_XXXXXX")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**username_contains:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**username_exact:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**username_startswith:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**alias_contains:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**alias_exact:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**application_id_exact:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**application_id_isnull:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**sub_account:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Endpoints::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.endpoints.<a href="/lib/vobiz/endpoints/client.rb">create_endpoint</a>(auth_id, request) -> Vobiz::Endpoints::Types::CreateEndpointResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new SIP endpoint that can be used to make and receive calls
through IP phones, softphones, or SIP clients. Each endpoint is
assigned a unique SIP URI and endpoint ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.endpoints.create_endpoint(
  auth_id: "MA_XXXXXX",
  username: "john_doe",
  password: "SecurePassword123!",
  alias_: "John's Desktop Phone",
  application: 12345678
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**username:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**alias_:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**application:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Endpoints::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.endpoints.<a href="/lib/vobiz/endpoints/client.rb">retrieve_endpoint</a>(auth_id, endpoint_id) -> Vobiz::Endpoints::Types::RetrieveEndpointResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the details of an existing endpoint. The response includes
all endpoint attributes and, if the endpoint is currently registered
on a SIP client, additional registration details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.endpoints.retrieve_endpoint(
  auth_id: "MA_XXXXXX",
  endpoint_id: "87654321"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Endpoints::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.endpoints.<a href="/lib/vobiz/endpoints/client.rb">update_endpoint</a>(auth_id, endpoint_id, request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing endpoint's configuration. You can change the
password, alias, or attached application. The fields `username`,
`endpoint_id`, `domain`, `allow_same_domain`, `allow_other_domains`,
`allow_phones`, and `allow_apps` are locked after creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.endpoints.update_endpoint(
  auth_id: "MA_XXXXXX",
  endpoint_id: "87654321",
  alias_: "John's Updated Desktop Phone",
  password: "NewSecurePassword456!"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**alias_:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Endpoints::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.endpoints.<a href="/lib/vobiz/endpoints/client.rb">delete_endpoint</a>(auth_id, endpoint_id) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete an endpoint from your Vobiz account. Once deleted,
the SIP URI will no longer be accessible, and any devices registered
with this endpoint will be disconnected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.endpoints.delete_endpoint(
  auth_id: "MA_XXXXXX",
  endpoint_id: "87654321"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**auth_id:** `String` — Your account Auth ID
    
</dd>
</dl>

<dl>
<dd>

**endpoint_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::Endpoints::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partner API
<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">get_partner_profile</a>() -> Vobiz::PartnerAPI::Types::GetPartnerProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the authenticated partner's profile and balance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.get_partner_profile
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">get_partner_dashboard</a>() -> Vobiz::PartnerAPI::Types::GetPartnerDashboardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Aggregated partner metrics - total customers, active accounts, balance
held across the partner ecosystem, MTD revenue, etc.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.get_partner_dashboard
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">list_customer_accounts</a>() -> Vobiz::PartnerAPI::Types::ListCustomerAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns all customer sub-accounts under your partner account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.list_customer_accounts
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` — Substring match on name or email.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">create_customer_account</a>(request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new customer sub-account under your partner account. VoBiz
emails the customer their login credentials and (separately) a KYC link
via the kyc-sessions endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.create_customer_account(
  name: "John Doe",
  email: "john@example.com",
  phone: "+919876543210",
  password: "SecurePass123!",
  country: "IN"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Customer's full name.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String` — Customer's email. KYC link is sent here.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `String` — E.164 format.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — Min 8 chars, must include a number and a special character.
    
</dd>
</dl>

<dl>
<dd>

**company:** `String` — Legal company or business name.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — ISO 2-letter country code.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">partner_transfer_balance</a>(customer_auth_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Atomically debits your partner master balance and credits the customer's
wallet. Both legs are recorded in each account's ledger. Transfers are
**permanent and cannot be reversed.**
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.partner_transfer_balance(
  customer_auth_id: "MA_ZKITB8Z2",
  amount: 500,
  currency: "INR"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Integer` — Positive decimal. Your master balance must be ≥ this amount.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String` — Must match your partner account currency.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Note for your records. Appears in both ledgers.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">list_customer_transactions</a>(customer_auth_id) -> Vobiz::PartnerAPI::Types::ListCustomerTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the customer's transaction ledger. Filter by date range or
transaction type. Useful for billing reconciliation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.list_customer_transactions(
  customer_auth_id: "customer_auth_id",
  from_date: "2026-03-01",
  to_date: "2026-03-31"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**from_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**to_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**transaction_type:** `Vobiz::PartnerAPI::Types::ListCustomerTransactionsRequestTransactionType` 
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">list_customer_cdrs</a>(customer_auth_id) -> Vobiz::PartnerAPI::Types::ListCustomerCdrsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Look up any customer's call history. Same filter set as the
customer-side CDR endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.list_customer_cdrs(
  customer_auth_id: "customer_auth_id",
  hangup_cause: "NO_ANSWER"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**call_direction:** `Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestCallDirection` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**min_duration:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**hangup_cause:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">list_customer_numbers</a>(customer_auth_id) -> Vobiz::PartnerAPI::Types::ListCustomerNumbersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Phone numbers currently assigned to a customer account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.list_customer_numbers(customer_auth_id: "customer_auth_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**search:** `String` — Substring match against the E.164 number.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**per_page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">list_kyc_sessions</a>() -> Vobiz::PartnerAPI::Types::ListKycSessionsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.list_kyc_sessions
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**status:** `Vobiz::PartnerAPI::Types::ListKycSessionsRequestStatus` 
    
</dd>
</dl>

<dl>
<dd>

**account_auth_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**size:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">create_kyc_session</a>(request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Triggers VoBiz to email a KYC link to the customer. KYC is OTP-based
(PAN + Aadhaar via DigiLocker for individuals, PAN + GSTIN for
companies). No document uploads required.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.create_kyc_session(account_auth_id: "MA_ZKITB8Z2")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**account_auth_id:** `String` — Customer's auth_id (from create-customer-account).
    
</dd>
</dl>

<dl>
<dd>

**flow_type:** `Vobiz::PartnerAPI::Types::CreateKycSessionRequestFlowType` 

Delivery mode. `email` (default) emails the customer the KYC link.
`redirect` returns a `widget_url` in the response for immediate redirect.
    
</dd>
</dl>

<dl>
<dd>

**customer_email:** `String` — Required when `flow_type` is `email`. Ignored otherwise.
    
</dd>
</dl>

<dl>
<dd>

**redirect_url:** `String` 

Required when `flow_type` is `redirect`. After verification the customer's
browser is sent to this URL with query params `session_id`, `status`, `auth_id`.
    
</dd>
</dl>

<dl>
<dd>

**webhook_url:** `String` — VoBiz POSTs the KYC result here.
    
</dd>
</dl>

<dl>
<dd>

**expires_in_days:** `Integer` — Days before the KYC link expires.
    
</dd>
</dl>

<dl>
<dd>

**reminder_schedule:** `Internal::Types::Array[Vobiz::PartnerAPI::Types::CreateKycSessionRequestReminderScheduleItem]` — Auto reminder emails before expiry. Email flow only.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Object]` — Free-form key/value object echoed back on GET and webhooks.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">get_kyc_session</a>(session_id) -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.get_kyc_session(session_id: "session_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**session_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">revoke_kyc_session</a>(session_id, request) -> Object</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels an outstanding KYC session. Customer can no longer use the link.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.revoke_kyc_session(session_id: "session_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**session_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reason:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner_api.<a href="/lib/vobiz/partner_api/client.rb">resend_kyc_session</a>(session_id) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-dispatches the KYC link to the customer. Rate-limited to once per 30 minutes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner_api.resend_kyc_session(session_id: "session_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**session_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Vobiz::PartnerAPI::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

