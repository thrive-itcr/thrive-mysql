# Copyright (c) General Electric Company, 2019.  All rights reserved.

FROM mysql:5.7

ADD startup docker-entrypoint-initdb.d
