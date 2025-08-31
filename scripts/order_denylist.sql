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
-- Name: order_denylist; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_denylist (
    denylist_string character varying(255) NOT NULL,
    order_denylist_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_denylist OWNER TO ofbiz;

--
-- Name: order_denylist pk_order_denylist; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_denylist
    ADD CONSTRAINT pk_order_denylist PRIMARY KEY (denylist_string, order_denylist_type_id);


--
-- Name: order_dny_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_dny_type ON order_denylist USING btree (order_denylist_type_id);


--
-- Name: ordr_dnlst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_dnlst_txcrts ON order_denylist USING btree (created_tx_stamp);


--
-- Name: ordr_dnlst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_dnlst_txstmp ON order_denylist USING btree (last_updated_tx_stamp);


--
-- Name: order_denylist order_dny_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_denylist
    ADD CONSTRAINT order_dny_type FOREIGN KEY (order_denylist_type_id) REFERENCES order_denylist_type(order_denylist_type_id);


--
-- PostgreSQL database dump complete
--

