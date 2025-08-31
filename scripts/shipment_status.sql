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
-- Name: shipment_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_status (
    status_id character varying(20) NOT NULL,
    shipment_id character varying(20) NOT NULL,
    status_date timestamp with time zone,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_status OWNER TO ofbiz;

--
-- Name: shipment_status pk_shipment_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_status
    ADD CONSTRAINT pk_shipment_status PRIMARY KEY (status_id, shipment_id);


--
-- Name: shpmnt_stts_shmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts_shmt ON shipment_status USING btree (shipment_id);


--
-- Name: shpmnt_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts_stts ON shipment_status USING btree (status_id);


--
-- Name: shpmnt_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts_txcrts ON shipment_status USING btree (created_tx_stamp);


--
-- Name: shpmnt_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts_txstmp ON shipment_status USING btree (last_updated_tx_stamp);


--
-- Name: shpmnt_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts_usrlgn ON shipment_status USING btree (change_by_user_login_id);


--
-- Name: shipment_status shpmnt_stts_shmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_status
    ADD CONSTRAINT shpmnt_stts_shmt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- Name: shipment_status shpmnt_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_status
    ADD CONSTRAINT shpmnt_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: shipment_status shpmnt_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_status
    ADD CONSTRAINT shpmnt_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

