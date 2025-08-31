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
-- Name: payment_gateway_clear_commerce; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_clear_commerce (
    payment_gateway_config_id character varying(20) NOT NULL,
    source_id character varying(60),
    group_id character varying(60),
    client_id character varying(60),
    username character varying(60),
    pwd character varying(255),
    user_alias character varying(60),
    effective_alias character varying(60),
    process_mode character(1),
    server_u_r_l character varying(255),
    enable_c_v_m character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_clear_commerce OWNER TO ofbiz;

--
-- Name: payment_gateway_clear_commerce pk_payment_gateway_clear_comme; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_clear_commerce
    ADD CONSTRAINT pk_payment_gateway_clear_comme PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgcc_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgcc_pgc ON payment_gateway_clear_commerce USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_clr_cmc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_clr_cmc_tp ON payment_gateway_clear_commerce USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_clr_cmc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_clr_cmc_ts ON payment_gateway_clear_commerce USING btree (created_tx_stamp);


--
-- Name: payment_gateway_clear_commerce pgcc_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_clear_commerce
    ADD CONSTRAINT pgcc_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

