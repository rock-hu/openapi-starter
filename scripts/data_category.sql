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
-- Name: data_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_category (
    data_category_id character varying(20) NOT NULL,
    parent_category_id character varying(20),
    category_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_category OWNER TO ofbiz;

--
-- Name: data_category pk_data_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_category
    ADD CONSTRAINT pk_data_category PRIMARY KEY (data_category_id);


--
-- Name: data_cat_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_cat_parent ON data_category USING btree (parent_category_id);


--
-- Name: dt_ctgr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_ctgr_txcrts ON data_category USING btree (created_tx_stamp);


--
-- Name: dt_ctgr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_ctgr_txstmp ON data_category USING btree (last_updated_tx_stamp);


--
-- Name: data_category data_cat_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_category
    ADD CONSTRAINT data_cat_parent FOREIGN KEY (parent_category_id) REFERENCES data_category(data_category_id);


--
-- PostgreSQL database dump complete
--

