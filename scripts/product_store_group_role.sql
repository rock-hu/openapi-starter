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
-- Name: product_store_group_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_group_role (
    product_store_group_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_group_role OWNER TO ofbiz;

--
-- Name: product_store_group_role pk_product_store_group_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_role
    ADD CONSTRAINT pk_product_store_group_role PRIMARY KEY (product_store_group_id, party_id, role_type_id);


--
-- Name: prt_str_grp_rl_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_rl_txp ON product_store_group_role USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_grp_rl_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_grp_rl_txs ON product_store_group_role USING btree (created_tx_stamp);


--
-- Name: psgrp_rle_psgp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psgrp_rle_psgp ON product_store_group_role USING btree (product_store_group_id);


--
-- Name: psgrp_rle_ptrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psgrp_rle_ptrle ON product_store_group_role USING btree (party_id, role_type_id);


--
-- Name: product_store_group_role psgrp_rle_psgp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_role
    ADD CONSTRAINT psgrp_rle_psgp FOREIGN KEY (product_store_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: product_store_group_role psgrp_rle_ptrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group_role
    ADD CONSTRAINT psgrp_rle_ptrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

