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
-- Name: product_store_group_rollup; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_group_rollup (
    product_store_group_id character varying(20) NOT NULL,
    parent_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_group_rollup OWNER TO ofbiz;

--
-- Name: product_store_group_rollup pk_product_store_group_rollup; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_rollup
    ADD CONSTRAINT pk_product_store_group_rollup PRIMARY KEY (product_store_group_id, parent_group_id, from_date);


--
-- Name: prt_str_grp_rlp_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_rlp_tp ON product_store_group_rollup USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_grp_rlp_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_rlp_ts ON product_store_group_rollup USING btree (created_tx_stamp);


--
-- Name: psgrp_rlp_current; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psgrp_rlp_current ON product_store_group_rollup USING btree (product_store_group_id);


--
-- Name: psgrp_rlp_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psgrp_rlp_parent ON product_store_group_rollup USING btree (parent_group_id);


--
-- Name: product_store_group_rollup psgrp_rlp_current; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_rollup
    ADD CONSTRAINT psgrp_rlp_current FOREIGN KEY (product_store_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: product_store_group_rollup psgrp_rlp_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_rollup
    ADD CONSTRAINT psgrp_rlp_parent FOREIGN KEY (parent_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- PostgreSQL database dump complete
--

