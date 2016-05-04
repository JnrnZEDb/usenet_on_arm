#!/bin/sh
chown -R postgres:postgres "$PGDATA"

if [[ ! -f "$PGDATA"/pg_hba.conf ]]; then
  echo "No db configured, creating one"
  gosu postgres initdb
  sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

  : "${PGUSER:="postgres"}"
  : "${PGDB:=$PGUSER}"

  if [[ -n "$PGPWD" ]]; then
   pass="PASSWORD $PGPWD"
   authMethod=md5
  else
   echo "==============================="
   echo "!!! Use \$PGPWD env var to secure your database !!!"
   echo "==============================="
   pass=
   authMethod=trust
  fi
  echo


  if [[ "$PGDB" != 'postgres' ]]; then
   createSql="CREATE DATABASE $PGDB;"
   echo "$createSql" | gosu postgres postgres --single -jE
   echo
  fi

  if [[ "$PGUSER" != 'postgres' ]]; then
   op=CREATE
  else
   op=ALTER
  fi

  userSql="$op USER $PGUSER WITH SUPERUSER $pass;"
  echo "$userSql" | gosu postgres postgres --single -jE
  echo

  { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
else
  echo "Found a database, using it.."
  ls -all "$PGDATA"
fi

exec gosu postgres postgres
