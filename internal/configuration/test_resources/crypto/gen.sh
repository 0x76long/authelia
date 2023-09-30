#!/bin/bash

## RSA 1024
go run ./cmd/authelia crypto certificate rsa generate --bits=1024 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.1024.crt' --file.ca-private-key='ca.rsa.1024.pem' -n='Authelia Development RSA 1024 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate rsa generate --bits=1024 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.1024.crt' --file.ca-private-key='ca.rsa.1024.pem' --file.certificate='rsa.1024.crt' --file.private-key='rsa.1024.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## RSA 2048
go run ./cmd/authelia crypto certificate rsa generate --bits=2048 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.2048.crt' --file.ca-private-key='ca.rsa.2048.pem' -n='Authelia Development RSA 2048 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate rsa generate --bits=2048 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.2048.crt' --file.ca-private-key='ca.rsa.2048.pem' --file.certificate='rsa.2048.crt' --file.private-key='rsa.2048.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## RSA 4096
go run ./cmd/authelia crypto certificate rsa generate --bits=4096 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.4096.crt' --file.ca-private-key='ca.rsa.4096.pem' -n='Authelia Development RSA 4096 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate rsa generate --bits=4096 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.rsa.4096.crt' --file.ca-private-key='ca.rsa.4096.pem' --file.certificate='rsa.4096.crt' --file.private-key='rsa.4096.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## ECDSA P224
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P224 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P224.crt' --file.ca-private-key='ca.ecdsa.P224.pem' -n='Authelia Development ECDSA P224 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P224 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P224.crt' --file.ca-private-key='ca.ecdsa.P224.pem' --file.certificate='ecdsa.P224.crt' --file.private-key='ecdsa.P224.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## ECDSA P256
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P256 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P256.crt' --file.ca-private-key='ca.ecdsa.P256.pem' -n='Authelia Development ECDSA P256 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P256 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P256.crt' --file.ca-private-key='ca.ecdsa.P256.pem' --file.certificate='ecdsa.P256.crt' --file.private-key='ecdsa.P256.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## ECDSA P384
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P384 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P384.crt' --file.ca-private-key='ca.ecdsa.P384.pem' -n='Authelia Development ECDSA P384 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P384 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P384.crt' --file.ca-private-key='ca.ecdsa.P384.pem' --file.certificate='ecdsa.P384.crt' --file.private-key='ecdsa.P384.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## ECDSA P521
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P521 --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P521.crt' --file.ca-private-key='ca.ecdsa.P521.pem' -n='Authelia Development ECDSA P521 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate ecdsa generate --curve=P521 --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ecdsa.P521.crt' --file.ca-private-key='ca.ecdsa.P521.pem' --file.certificate='ecdsa.P521.crt' --file.private-key='ecdsa.P521.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy

## Ed25519
go run ./cmd/authelia crypto certificate ed25519 generate --directory='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ed25519.crt' --file.ca-private-key='ca.ed25519.pem' -n='Authelia Development ed25519 Ed25519 Standalone Root CA' --not-before='Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --ca --legacy
go run ./cmd/authelia crypto certificate ed25519 generate --directory='./internal/configuration/test_resources/crypto' --path.ca='./internal/configuration/test_resources/crypto' --file.ca-certificate='ca.ed25519.crt' --file.ca-private-key='ca.ed25519.pem' --file.certificate='ed25519.crt' --file.private-key='ed25519.pem' --sans='example.com' --not-before 'Jan 1 00:00:00 2000' --not-after='Jan 1 00:00:00 2100' -o='Authelia' --organizational-unit='Development' --legacy