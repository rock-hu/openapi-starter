--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mrp_event; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE mrp_event (
    mrp_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    event_date timestamp with time zone NOT NULL,
    mrp_event_type_id character varying(20) NOT NULL,
    facility_id character varying(20),
    quantity double precision,
    event_name text,
    is_late character(1),
    facility_id_to character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.mrp_event OWNER TO ofbiz;

--
-- Name: mrp_event pk_mrp_event; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mrp_event
    ADD CONSTRAINT pk_mrp_event PRIMARY KEY (mrp_id, product_id, event_date, mrp_event_type_id);


--
-- Name: mrp_event_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrp_event_txcrts ON mrp_event USING btree (created_tx_stamp);


--
-- Name: mrp_event_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrp_event_txstmp ON mrp_event USING btree (last_updated_tx_stamp);


--
-- Name: mrpev_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrpev_fac ON mrp_event USING btree (facility_id);


--
-- Name: mrpev_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrpev_prod ON mrp_event USING btree (product_id);


--
-- Name: mrpev_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrpev_typ ON mrp_event USING btree (mrp_event_type_id);


--
-- Name: mrp_event mrpev_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mrp_event
    ADD CONSTRAINT mrpev_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: mrp_event mrpev_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mrp_event
    ADD CONSTRAINT mrpev_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: mrp_event mrpev_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mrp_event
    ADD CONSTRAINT mrpev_typ FOREIGN KEY (mrp_event_type_id) REFERENCES mrp_event_type(mrp_event_type_id);


--
-- PostgreSQL database dump complete
--

