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
-- Name: fin_account_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fin_account_role (
    fin_account_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fin_account_role OWNER TO ofbiz;

--
-- Name: fin_account_role pk_fin_account_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_role
    ADD CONSTRAINT pk_fin_account_role PRIMARY KEY (fin_account_id, party_id, role_type_id, from_date);


--
-- Name: fin_act_rl_fnact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_rl_fnact ON fin_account_role USING btree (fin_account_id);


--
-- Name: fin_act_rl_rtrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_rl_rtrl ON fin_account_role USING btree (party_id, role_type_id);


--
-- Name: fn_accnt_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_accnt_rl_txcrts ON fin_account_role USING btree (created_tx_stamp);


--
-- Name: fn_accnt_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_accnt_rl_txstmp ON fin_account_role USING btree (last_updated_tx_stamp);


--
-- Name: fin_account_role fin_act_rl_fnact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_role
    ADD CONSTRAINT fin_act_rl_fnact FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: fin_account_role fin_act_rl_rtrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_role
    ADD CONSTRAINT fin_act_rl_rtrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

