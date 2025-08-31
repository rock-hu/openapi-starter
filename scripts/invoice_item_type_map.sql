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
-- Name: invoice_item_type_map; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item_type_map (
    invoice_item_map_key character varying(20) NOT NULL,
    invoice_type_id character varying(20) NOT NULL,
    invoice_item_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item_type_map OWNER TO ofbiz;

--
-- Name: invoice_item_type_map pk_invoice_item_type_map; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_map
    ADD CONSTRAINT pk_invoice_item_type_map PRIMARY KEY (invoice_item_map_key, invoice_type_id);


--
-- Name: inc_itm_tp_mp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_tp_mp_txcs ON invoice_item_type_map USING btree (created_tx_stamp);


--
-- Name: inc_itm_tp_mp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_tp_mp_txsp ON invoice_item_type_map USING btree (last_updated_tx_stamp);


--
-- Name: invitmmap_invtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invitmmap_invtyp ON invoice_item_type_map USING btree (invoice_type_id);


--
-- Name: invoice_item_map; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_item_map ON invoice_item_type_map USING btree (invoice_item_type_id);


--
-- Name: invoice_item_type_map invitmmap_invtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_map
    ADD CONSTRAINT invitmmap_invtyp FOREIGN KEY (invoice_type_id) REFERENCES invoice_type(invoice_type_id);


--
-- Name: invoice_item_type_map invoice_item_map; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_map
    ADD CONSTRAINT invoice_item_map FOREIGN KEY (invoice_item_type_id) REFERENCES invoice_item_type(invoice_item_type_id);


--
-- PostgreSQL database dump complete
--

