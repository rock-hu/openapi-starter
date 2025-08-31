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
-- Name: requirement_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE requirement_role (
    requirement_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.requirement_role OWNER TO ofbiz;

--
-- Name: requirement_role pk_requirement_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_role
    ADD CONSTRAINT pk_requirement_role PRIMARY KEY (requirement_id, party_id, role_type_id, from_date);


--
-- Name: req_role_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_role_prole ON requirement_role USING btree (party_id, role_type_id);


--
-- Name: req_role_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_role_prty ON requirement_role USING btree (party_id);


--
-- Name: req_role_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_role_req ON requirement_role USING btree (requirement_id);


--
-- Name: rqrmnt_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrmnt_rl_txcrts ON requirement_role USING btree (created_tx_stamp);


--
-- Name: rqrmnt_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrmnt_rl_txstmp ON requirement_role USING btree (last_updated_tx_stamp);


--
-- Name: requirement_role req_role_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_role
    ADD CONSTRAINT req_role_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: requirement_role req_role_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_role
    ADD CONSTRAINT req_role_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: requirement_role req_role_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_role
    ADD CONSTRAINT req_role_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- PostgreSQL database dump complete
--

