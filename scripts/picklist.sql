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
-- Name: picklist; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist (
    picklist_id character varying(20) NOT NULL,
    description character varying(255),
    facility_id character varying(20),
    shipment_method_type_id character varying(20),
    status_id character varying(20),
    picklist_date timestamp with time zone,
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist OWNER TO ofbiz;

--
-- Name: picklist pk_picklist; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist
    ADD CONSTRAINT pk_picklist PRIMARY KEY (picklist_id);


--
-- Name: picklist_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklist_txcrts ON picklist USING btree (created_tx_stamp);


--
-- Name: picklist_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklist_txstmp ON picklist USING btree (last_updated_tx_stamp);


--
-- Name: picklst_flty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklst_flty ON picklist USING btree (facility_id);


--
-- Name: picklst_smtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklst_smtp ON picklist USING btree (shipment_method_type_id);


--
-- Name: picklst_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklst_stts ON picklist USING btree (status_id);


--
-- Name: picklist picklst_flty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist
    ADD CONSTRAINT picklst_flty FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: picklist picklst_smtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist
    ADD CONSTRAINT picklst_smtp FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- Name: picklist picklst_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist
    ADD CONSTRAINT picklst_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

