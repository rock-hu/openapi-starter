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
-- Name: uom_conversion; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE uom_conversion (
    uom_id character varying(20) NOT NULL,
    uom_id_to character varying(20) NOT NULL,
    conversion_factor double precision,
    custom_method_id character varying(20),
    decimal_scale numeric(20,0),
    rounding_mode character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.uom_conversion OWNER TO ofbiz;

--
-- Name: uom_conversion pk_uom_conversion; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_conversion
    ADD CONSTRAINT pk_uom_conversion PRIMARY KEY (uom_id, uom_id_to);


--
-- Name: um_cnvrsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX um_cnvrsn_txcrts ON uom_conversion USING btree (created_tx_stamp);


--
-- Name: um_cnvrsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX um_cnvrsn_txstmp ON uom_conversion USING btree (last_updated_tx_stamp);


--
-- Name: uom_conv_main; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_conv_main ON uom_conversion USING btree (uom_id);


--
-- Name: uom_conv_to; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_conv_to ON uom_conversion USING btree (uom_id_to);


--
-- Name: uom_custom_method; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_custom_method ON uom_conversion USING btree (custom_method_id);


--
-- Name: uom_conversion uom_conv_main; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_conversion
    ADD CONSTRAINT uom_conv_main FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- Name: uom_conversion uom_conv_to; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_conversion
    ADD CONSTRAINT uom_conv_to FOREIGN KEY (uom_id_to) REFERENCES uom(uom_id);


--
-- Name: uom_conversion uom_custom_method; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_conversion
    ADD CONSTRAINT uom_custom_method FOREIGN KEY (custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- PostgreSQL database dump complete
--

