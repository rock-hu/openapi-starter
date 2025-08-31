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
-- Name: party_rate_new; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_rate_new (
    party_id character varying(20) NOT NULL,
    rate_type_id character varying(20) NOT NULL,
    default_rate character(1),
    percentage_used double precision,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_rate_new OWNER TO ofbiz;

--
-- Name: party_rate_new pk_party_rate_new; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_rate_new
    ADD CONSTRAINT pk_party_rate_new PRIMARY KEY (party_id, rate_type_id, from_date);


--
-- Name: prt_rt_nw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rt_nw_txcrts ON party_rate_new USING btree (created_tx_stamp);


--
-- Name: prt_rt_nw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rt_nw_txstmp ON party_rate_new USING btree (last_updated_tx_stamp);


--
-- Name: prty_rate_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prty_rate_prty ON party_rate_new USING btree (party_id);


--
-- Name: prty_rate_rttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prty_rate_rttp ON party_rate_new USING btree (rate_type_id);


--
-- Name: party_rate_new prty_rate_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_rate_new
    ADD CONSTRAINT prty_rate_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_rate_new prty_rate_rttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_rate_new
    ADD CONSTRAINT prty_rate_rttp FOREIGN KEY (rate_type_id) REFERENCES rate_type(rate_type_id);


--
-- PostgreSQL database dump complete
--

