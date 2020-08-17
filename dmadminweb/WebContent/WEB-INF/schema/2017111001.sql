CREATE OR REPLACE FUNCTION dm.queue_event() RETURNS TRIGGER AS $$ DECLARE data varchar; BEGIN data = '<row id="' || NEW.id || '" clientid="' || NEW.clientid || '" credentials="' || NEW.credentials || '" stdin="' || NEW.stdin || '" command="' || NEW.command || '" />'; PERFORM pg_notify('q_event_'||NEW.clientid,data); RETURN NULL; END; $$ LANGUAGE plpgsql;