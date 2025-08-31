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
-- Name: party_profile_default; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_profile_default (
    party_id character varying(20) NOT NULL,
    product_store_id character varying(20) NOT NULL,
    default_ship_addr character varying(20),
    default_bill_addr character varying(20),
    default_pay_meth character varying(20),
    default_ship_meth character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_profile_default OWNER TO ofbiz;

--
-- Name: party_profile_default pk_party_profile_default; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_profile_default
    ADD CONSTRAINT pk_party_profile_default PRIMARY KEY (party_id, product_store_id);


--
-- Name: party_prof_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_prof_party ON party_profile_default USING btree (party_id);


--
-- Name: party_prof_pstore; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_prof_pstore ON party_profile_default USING btree (product_store_id);


--
-- Name: prt_prl_dft_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prl_dft_txcrts ON party_profile_default USING btree (created_tx_stamp);


--
-- Name: prt_prl_dft_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prl_dft_txstmp ON party_profile_default USING btree (last_updated_tx_stamp);


--
-- Name: party_profile_default party_prof_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_profile_default
    ADD CONSTRAINT party_prof_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_profile_default party_prof_pstore; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_profile_default
    ADD CONSTRAINT party_prof_pstore FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

