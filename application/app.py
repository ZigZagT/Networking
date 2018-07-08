#!/usr/bin/env python3

from sanic import Sanic

import config
from application.dns import bp
from application.setup.db import setup_sqlalchemy, teardown_sqlalchemy

app = Sanic()
app.config.from_object(config)


@app.listener('before_server_start')
def setup(app, loop):
    setup_sqlalchemy(app)


@app.listener('after_server_stop')
def teardown(app, loop):
    teardown_sqlalchemy(app)


app.blueprint(bp)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
