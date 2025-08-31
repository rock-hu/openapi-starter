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
-- Name: shopping_list_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shopping_list_type (
    shopping_list_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shopping_list_type OWNER TO ofbiz;

--
-- Name: shopping_list_type pk_shopping_list_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_type
    ADD CONSTRAINT pk_shopping_list_type PRIMARY KEY (shopping_list_type_id);


--
-- Name: shppg_lst_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppg_lst_tp_txcrs ON shopping_list_type USING btree (created_tx_stamp);


--
-- Name: shppg_lst_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppg_lst_tp_txstp ON shopping_list_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

