#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/vobiz'

AUTH_ID = ENV['VOBIZ_AUTH_ID']
AUTH_TOKEN = ENV['VOBIZ_AUTH_TOKEN']

if AUTH_ID.to_s.empty? || AUTH_TOKEN.to_s.empty?
  warn 'Missing required env vars: VOBIZ_AUTH_ID and VOBIZ_AUTH_TOKEN'
  exit 1
end

client = Vobiz::Client.new(AUTH_ID, AUTH_TOKEN, debug: ENV['VOBIZ_DEBUG'] == 'true')

passed = 0
failed = 0


def section(name)
  puts "\n[#{name}]"
end

def preview(val)
  s = val.is_a?(String) ? val : val.inspect
  s.length > 140 ? "#{s[0...140]}..." : s
end

def test(name)
  result = yield
  puts "\e[32m✓\e[0m #{name}"
  puts "  \e[90m#{preview(result)}\e[0m" unless result.nil?
  [true, result]
rescue StandardError => e
  puts "\e[31m✗\e[0m #{name}"
  puts "  \e[31m#{e.message}\e[0m"
  [false, nil]
end

puts "\n=============================================="
puts 'Vobiz Ruby SDK — API Reachability Test Suite'
puts '=============================================='

section('1. Account')
ok, = test('account.get_profile') { client.account.get_profile }
passed += 1 if ok
failed += 1 unless ok

section('2. Balance / Transactions / Concurrency')
ok, = test('balance.get("INR")') { client.balance.get('INR') }
passed += 1 if ok
failed += 1 unless ok

ok, = test('balance.list_transactions(limit: 5)') { client.balance.list_transactions(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('balance.get_concurrency') { client.balance.get_concurrency }
passed += 1 if ok
failed += 1 unless ok

section('3. CDR')
ok, = test('cdr.list(per_page: 5, page: 1)') { client.cdr.list(per_page: 5, page: 1) }
passed += 1 if ok
failed += 1 unless ok

section('4. Voice Calls (read-only checks)')
ok, = test('calls.list_live_calls') { client.calls.list_live_calls }
passed += 1 if ok
failed += 1 unless ok

ok, = test('calls.list_queued_calls') { client.calls.list_queued_calls }
passed += 1 if ok
failed += 1 unless ok

section('5. Trunks / Credentials / IP ACL / Origination URIs')
ok, trunks = test('trunks.list(limit: 5)') { client.trunks.list(limit: 5, offset: 0) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('credentials.list(limit: 5)') { client.credentials.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('ip_acl.list(limit: 5)') { client.ip_acl.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('origination_uris.list(limit: 5)') { client.origination_uris.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

section('6. Numbers')
ok, = test('numbers.list') { client.numbers.list }
passed += 1 if ok
failed += 1 unless ok

ok, = test('numbers.list_inventory(per_page: 5)') { client.numbers.list_inventory(per_page: 5) }
passed += 1 if ok
failed += 1 unless ok

section('7. Legacy resources')
ok, = test('applications.list(limit: 5)') { client.applications.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('endpoints.list(limit: 5)') { client.endpoints.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('recordings.list(limit: 5)') { client.recordings.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

ok, = test('conferences.list') { client.conferences.list }
passed += 1 if ok
failed += 1 unless ok

section('8. Subaccounts')
ok, = test('subaccounts.list(limit: 5)') { client.subaccounts.list(limit: 5) }
passed += 1 if ok
failed += 1 unless ok

puts "\n================ SUMMARY ================"
puts "PASSED: #{passed}"
puts "FAILED: #{failed}"
puts '========================================='

exit(failed.zero? ? 0 : 1)
