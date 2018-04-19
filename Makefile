DASHD=digitalcoind
DASHGUI=digitalcoin-qt
DASHCLI=digitalcoin-cli
B1_FLAGS=
B2_FLAGS=
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

start:
	$(DASHD) $(B1) -daemon
	$(DASHD) $(B2) -daemon

start-gui:
	$(DASHGUI) $(B1) &
	$(DASHGUI) $(B2) &

generate:
	$(DASHCLI) $(B1) generate $(BLOCKS)

getinfo:
	$(DASHCLI) $(B1) getinfo
	$(DASHCLI) $(B2) getinfo

sendfrom1:
	$(DASHCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

sendfrom2:
	$(DASHCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)

address1:
	$(DASHCLI) $(B1) getnewaddress $(ACCOUNT)

address2:
	$(DASHCLI) $(B2) getnewaddress $(ACCOUNT)

stop:
	$(DASHCLI) $(B1) stop
	$(DASHCLI) $(B2) stop

clean:
	find 1/regtest/* -not -name 'server.*' -delete
	find 2/regtest/* -not -name 'server.*' -delete
