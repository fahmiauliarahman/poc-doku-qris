package pkg

import (
	"time"

	resty "resty.dev/v3"
)

func NewRestyClient() *resty.Client {
	// Create circuit breaker with required values
	cb := resty.NewCircuitBreaker().
		SetTimeout(10 * time.Second). // 10 seconds timeout, if no response, consider it as a failure
		SetFailureThreshold(5).       // 5 consecutive failures, trigger the circuit breaker to open state
		SetSuccessThreshold(3)        // 3 consecutive successes, close the circuit breaker.

	// Create Resty client with circuit breaker
	client := resty.New().
		SetTimeout(10 * time.Second).
		SetCircuitBreaker(cb).
		SetRetryCount(4) // Retry 5 times (including the initial request)

	return client
}
