init_api:
	hz new --model_dir biz/model --handler_dir biz/handler --router_dir biz/router -mod github.com/fahmiauliarahman/poc-doku-qris -idl idl/doku.thrift

update_api:
	hz update --model_dir biz/model --handler_dir biz/handler -idl idl/doku.thrift


dev:
	air