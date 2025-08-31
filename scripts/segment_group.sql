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
-- Name: segment_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE segment_group (
    segment_group_id character varying(20) NOT NULL,
    segment_group_type_id character varying(20),
    description character varying(255),
    product_store_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.segment_group OWNER TO ofbiz;

--
-- Name: segment_group pk_segment_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group
    ADD CONSTRAINT pk_segment_group PRIMARY KEY (segment_group_id);


--
-- Name: sgmnt_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmnt_grp_txcrts ON segment_group USING btree (created_tx_stamp);


--
-- Name: sgmnt_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmnt_grp_txstmp ON segment_group USING btree (last_updated_tx_stamp);


--
-- Name: sgmtgrp_prst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrp_prst ON segment_group USING btree (product_store_id);


--
-- Name: sgmtgrp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrp_type ON segment_group USING btree (segment_group_type_id);


--
-- Name: segment_group sgmtgrp_prst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group
    ADD CONSTRAINT sgmtgrp_prst FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: segment_group sgmtgrp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group
    ADD CONSTRAINT sgmtgrp_type FOREIGN KEY (segment_group_type_id) REFERENCES segment_group_type(segment_group_type_id);


--
-- PostgreSQL database dump complete
--

