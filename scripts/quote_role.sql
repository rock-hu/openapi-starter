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
-- Name: quote_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_role (
    quote_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_role OWNER TO ofbiz;

--
-- Name: quote_role pk_quote_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_role
    ADD CONSTRAINT pk_quote_role PRIMARY KEY (quote_id, party_id, role_type_id);


--
-- Name: quote_rl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_rl_party ON quote_role USING btree (party_id);


--
-- Name: quote_rl_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_rl_prole ON quote_role USING btree (party_id, role_type_id);


--
-- Name: quote_rl_quote; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_rl_quote ON quote_role USING btree (quote_id);


--
-- Name: quote_role_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_role_txcrts ON quote_role USING btree (created_tx_stamp);


--
-- Name: quote_role_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_role_txstmp ON quote_role USING btree (last_updated_tx_stamp);


--
-- Name: quote_role quote_rl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_role
    ADD CONSTRAINT quote_rl_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: quote_role quote_rl_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_role
    ADD CONSTRAINT quote_rl_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: quote_role quote_rl_quote; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_role
    ADD CONSTRAINT quote_rl_quote FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- PostgreSQL database dump complete
--

