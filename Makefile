init_api:
	hz new --model_dir internal/types --handler_dir internal/handler --router_dir internal/router -mod github.com/fahmiauliarahman/poc-doku-qris -idl idl/doku.thrift

update_api:
	hz update --model_dir internal/types --handler_dir internal/handler -idl idl/doku.thrift


dev:
	air