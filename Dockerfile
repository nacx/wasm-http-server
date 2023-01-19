# Copyright (c) Tetrate, Inc 2022 All Rights Reserved.

FROM scratch

COPY wasm-http-server-static /usr/local/bin/wasm-http-server-static

ENTRYPOINT [ "/usr/local/bin/wasm-http-server-static" ]
