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
-- Name: product_search_constraint; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_search_constraint (
    product_search_result_id character varying(20) NOT NULL,
    constraint_seq_id character varying(20) NOT NULL,
    constraint_name character varying(255),
    info_string character varying(255),
    include_sub_categories character(1),
    is_and character(1),
    any_prefix character(1),
    any_suffix character(1),
    remove_stems character(1),
    low_value character varying(60),
    high_value character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_search_constraint OWNER TO ofbiz;

--
-- Name: product_search_constraint pk_product_search_constraint; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_search_constraint
    ADD CONSTRAINT pk_product_search_constraint PRIMARY KEY (product_search_result_id, constraint_seq_id);


--
-- Name: prod_schrsi_res; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_schrsi_res ON product_search_constraint USING btree (product_search_result_id);


--
-- Name: prt_srh_cnstt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_srh_cnstt_txcs ON product_search_constraint USING btree (created_tx_stamp);


--
-- Name: prt_srh_cnstt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_srh_cnstt_txsp ON product_search_constraint USING btree (last_updated_tx_stamp);


--
-- Name: product_search_constraint prod_schrsi_res; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_search_constraint
    ADD CONSTRAINT prod_schrsi_res FOREIGN KEY (product_search_result_id) REFERENCES product_search_result(product_search_result_id);


--
-- PostgreSQL database dump complete
--

